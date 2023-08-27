
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RecipeIngreController extends GetxController{
  XFile? _file;
  XFile? get file => _file;

  File? _image;
  File? get image => _image;

  

  List<String> _tags = [];
  List<String> get tags => _tags;

  addTags(String text){
    // _tags = [];
    _tags.add('"$text"');
    update();
  }

  removeTags(String text){
    _tags.remove('"$text"');
    update();
  }
  
  changeVideoFile(XFile? receivedFile){
    _file = receivedFile;
    update();
  }

  changeImageFile(File? receivedImage){
    _image = receivedImage;
    update();
  }
}