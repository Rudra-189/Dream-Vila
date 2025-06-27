// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:toastification/toastification.dart';

import '../../../widgets/common_widget/app_toast_message.dart';

enum RequestType { GET, POST, PUT, DELETE, PATCH, MULTIPART_POST }

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json'}))
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        request: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ) {
    _initializeHeaders();
  }

  Future<void> _initializeHeaders() async {
    final headers = await _buildHeaders();
    _dio.options.headers = headers;
  }

  // --------------------------- HEADERS ---------------------------

  static Future<Map<String, String>> _buildHeaders() async {
    final storage = FlutterSecureStorage();
    final header = <String, String>{'Content-Type': 'application/json'};
    String? deviceToken = await storage.read(key: "deviceToken");

    if (deviceToken != null && deviceToken.isNotEmpty) {
      header['Authorization'] = 'Bearer $deviceToken';
    }
    return header;
  }

  // --------------------------- REQUEST METHOD ---------------------------

  Future<Map<String, dynamic>> request(
      RequestType type,
      String path, {
        Map<String, dynamic>? data,
        Map<String, dynamic>? multipartData,
      }) async {
    try {
      _dio.options.headers = await _buildHeaders();

      final Response response = switch (type) {
        RequestType.GET => await _dio.get(path),
        RequestType.POST => await _dio.post(path, data: data),
        RequestType.PUT => await _dio.put(path, data: data),
        RequestType.DELETE => await _dio.delete(path),
        RequestType.PATCH => await _dio.patch(path, data: data),
        RequestType.MULTIPART_POST => await _dio.post(path, data: await _buildMultipartForm(multipartData)),
      };

      return _handleSuccess(response);
    } on DioException catch (error) {
      return _handleDioError(error); // ✅ no rethrow
    } catch (e) {
      AppToast.show(
        message: "Unexpected error occurred",
        type: ToastificationType.error,
      );
      return {
        'status': false,
        'message': "Unexpected error occurred",
      };
    }
  }

  // --------------------------- SUCCESS HANDLERS ---------------------------

  Map<String, dynamic> _handleSuccess(Response response) {
    if ([200, 201, 204].contains(response.statusCode)) {
      if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        return {
          'status': true,
          'message': 'Success',
          'data': response.data,
        };
      }
    } else {
      return _handleFailure(response); // safe version
    }
  }

  // --------------------------- ERROR HANDLERS ---------------------------

  Map<String, dynamic> _handleFailure(Response response) {
    final code = response.statusCode ?? 0;
    final responseData = response.data;
    String message = "Something went wrong";

    if (responseData is Map<String, dynamic>) {
      if (responseData.containsKey('validationErrors') && responseData['validationErrors'] is List) {
        final List errors = responseData['validationErrors'];
        if (errors.isNotEmpty) {
          message = errors.map((e) => e['message']).where((m) => m != null).join('');
          if (message.isEmpty) {
            message = "Validation error occurred";
          }
        }
      } else if (responseData.containsKey('message')) {
        message = responseData['message'];
      } else if (responseData.containsKey('title')) {
        message = responseData['title'];
      }
    }

    if ([400, 401, 403, 422, 500].contains(code)) {
      AppToast.show(message: message, type: ToastificationType.error);
    } else if ([404, 409].contains(code)) {
      AppToast.show(message: message, type: ToastificationType.warning);
    } else if ([429, 503].contains(code)) {
      AppToast.show(message: message, type: ToastificationType.info);
    } else {
      AppToast.show(message: message, type: ToastificationType.error);
    }

    return {
      'status': false,
      'message': message,
    };
  }

  Map<String, dynamic> _handleDioError(DioException error) {
    if (error.response != null) {
      return _handleFailure(error.response!);
    } else {
      final message = error.message ?? "Network error. Please check your connection.";
      // AppToast.show(message: message, type: ToastificationType.error);

      return {
        'status': false,
        'message': message,
      };
    }
  }

  // --------------------------- MULTIPART FORM BUILDER ---------------------------

  Future<FormData> _buildMultipartForm(Map<String, dynamic>? data) async {
    final formData = FormData();

    if (data == null || data.isEmpty) return formData;

    for (final entry in data.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is List && value.isNotEmpty && value.first is String) {
        for (final path in value) {
          formData.files.add(MapEntry(key, await MultipartFile.fromFile(path)));
        }
      } else {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    }

    return formData;
  }
}
