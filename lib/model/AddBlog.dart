import 'dart:io';
import 'package:flutter/foundation.dart';

import 'Filter.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBlog extends ChangeNotifier {
  String title = "";
  String content = "";

  File? image;
  var downloadurl;
  List categoryAdded = [];
  CollectionReference users = FirebaseFirestore.instance.collection('blog');

  final storage = firebase_storage.FirebaseStorage.instance;
  Future<void> downloadURL() async {
    downloadurl = await firebase_storage.FirebaseStorage.instance
        .ref('dam/image')
        .getDownloadURL();
    print(downloadurl + "this is the onw");
    print("hop ra");
  }

  Future<void> addContent() {
    List categories = [];
    categories = categoryAdded.map((e) => e.name).toList();
    return users
        .add({
          'title': title,
          'body': content,
          'categories': categories,
          'image': downloadurl,
          'author': "as",
          'likes': 0,
        })
        .then((value) => print("Content added"))
        .catchError((error) => print("Failed to add content: $error"));
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setContent(String content) {
    this.content = content;
  }

  void setImage(File? image) {
    this.image = image;
    if (image != null) {
      storage
          .ref()
          .child('dam/image')
          .putFile(image)
          .whenComplete(() => downloadURL());
    }
  }

  void setCategory(List category) {
    categoryAdded = category;
  }

  void submit() {
    if (downloadurl != null && content != null && title != null) {
      addContent();
    }
  }
}
