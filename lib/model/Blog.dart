import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String title;
  final String content;
  final String author;
  final int likes;

  Blog(
      {required this.title,
      required this.content,
      required this.author,
      required this.likes});
}

class BlogListProvider extends ChangeNotifier {
  List blogs = [];

  CollectionReference users = FirebaseFirestore.instance.collection('blog');

  void fetchBlogs() async {
    QuerySnapshot querySnapshot = await users.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    blogs = allData;
    notifyListeners();
  }

  void filterBlog(String type) async {
    QuerySnapshot querySnapshot =
        await users.where("categories", arrayContains: type).get();
    print(querySnapshot.docs.map((e) => print(e.data())));
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    blogs = allData;

    notifyListeners();
  }
}
