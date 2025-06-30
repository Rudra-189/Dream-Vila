import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker imagePicker = ImagePicker();

  Future<XFile?> pickImageFromGallary() async {
    final XFile? file =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      return file;
    } else {
      return null;
    }
  }

  Future<List<XFile>?> pickMultipleImageFromGallery() async {
    try {
      final pickedFiles = await ImagePicker().pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        return pickedFiles;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
