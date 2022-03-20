import 'dart:io';
import 'package:flutter/foundation.dart';

class AddBlog extends ChangeNotifier{
  String title = "";
  String content = "";
  File? image;
  List<String> category = [];

  void setTitle(String title){
    this.title = title;
  }

  void setContent(String content){
    this.content = content;
  }

  void setImage(File? image){
    this.image = image;
  }

  void setCategory(List<String> category){
    this.category = category;
  }

}