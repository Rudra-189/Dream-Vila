
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{

  final ImagePicker imagePicker = ImagePicker();


  Future<XFile?>PickImageFromGallary()async{
    print("//////////////////////PickImageFromGallary//////////////////////////////////");
    final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if(file != null){
      return file;
    }else{
      return null;
    }
  }

  Future<List<XFile>?>pickMultipleImageFromGallery()async{
    try {
      final pickedFiles = await ImagePicker().pickMultiImage();
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        return pickedFiles;
      }
      return null;
    } catch (e) {
      print("Image picker error: $e");
      return null;
    }
  }
}