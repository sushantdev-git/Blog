import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/model/Blog.dart';

class BlogPage extends StatelessWidget {
  BlogPage({required this.body, required this.title, required this.image});
  String body;
  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black45,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.9),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ), //image
          Container(
            padding: EdgeInsets.all(22),
            // color: Colors.white,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Text(
              title,
              style: GoogleFonts.getFont('Poppins').copyWith(
                fontSize: 20,
              ),
            ),
          ), //title
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Text(body),
          ), //body
          // comments
        ],
      ),
    );
  }
}
