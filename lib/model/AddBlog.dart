import 'dart:io';
import 'package:flutter/foundation.dart';

class AddBlog extends ChangeNotifier{
  String title = "";
  String content = "";
  File? image;

  void setTitle(String title){
    this.title = title;
  }

  void setContent(String content){
    this.content = content;
  }

  void setImage(File? image){
    this.image = image;
    print("image set");
    print(image);
  }
}