import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Blog{
  final String title;
  final String content;
  final String author;
  final int likes;

  Blog({required this.title, required this.content, required this.author, required this.likes});
}

class BlogListProvider extends ChangeNotifier{
  List _blogs = [];

  CollectionReference users = FirebaseFirestore.instance.collection('blog');

  void fetchBlogs() async {
    QuerySnapshot querySnapshot = await users.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    _blogs = allData;
    print(_blogs);
  }

  BlogListProvider(){
    print("provider init");
    fetchBlogs();
  }

}