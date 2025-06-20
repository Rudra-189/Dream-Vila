
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{

  final ImagePicker imagePicker = ImagePicker();

  Future<XFile?>PickImageFromGallary()async{
    final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if(file != null){
      return file;
    }else{
      return null;
    }
  }

  Future<List<XFile>?>pickMultipleImageFromGallery()async{
    final List<XFile> file = await imagePicker.pickMultiImage();
    if(file != null){
      return file;
    }else{
      return null;
    }
  }
}