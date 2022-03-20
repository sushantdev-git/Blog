import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home/widgets/home/home.dart';
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
  Future<void> downloadURL(String unique) async {
    print(unique + "unique ae");
    downloadurl = await firebase_storage.FirebaseStorage.instance
        .ref(unique)
        .getDownloadURL();
    print(downloadurl + "this is the onw");
    addContent(downloadurl);
    print("hop ra");
  }

  Future<void> addContent(String downloadurl) {
    if (downloadurl == null) {
      print('nhi hua');
    }
    List categories = [];
    categories = categoryAdded.map((e) => e.name).toList();
    return users.add({
      'title': title,
      'body': content,
      'categories': categories,
      'image': downloadurl,
      'author': "as",
      'likes': 0,
    }).then((value) {
      print("Content added");
      this.title = "";
      this.content = "";
      this.image = null;
      this.categoryAdded = [];
    }).catchError((error) => print("Failed to add content: $error"));
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setContent(String content) {
    this.content = content;
  }

  void setImage(File? image) {
    this.image = image;
  }

  void setCategory(List category) {
    categoryAdded = category;
  }

  void clear() {
    this.title = "";
  }

  void submit() {
    DateTime now = DateTime.now();
    String unique =
        now.day.toString() + now.hour.toString() + now.second.toString();
    if (content != null && title != null) {
      if (image != null) {
        storage
            .ref()
            .child('${unique}')
            .putFile(image!)
            .whenComplete(() => downloadURL(unique));
      }
    }
  }
}
