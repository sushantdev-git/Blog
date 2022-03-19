import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
class BlogEntry extends StatefulWidget {
  const BlogEntry({Key? key}) : super(key: key);

  @override
  State<BlogEntry> createState() => _BlogEntryState();
}

class _BlogEntryState extends State<BlogEntry> {
  File ? image;

  Future pickImage() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    }
    on PlatformException catch (e){
      // print("image loading failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Add Blog",
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(top: 0, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey,
                image: image != null ? DecorationImage(image: FileImage(image!)) : null,
              ),
              constraints: const BoxConstraints(
                maxHeight: 200,
              ),
              child: Center(
                child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: (){
                      pickImage();
                    },
                ),
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Content',
              ),
            )
          ],
        ),
      ),
    );
  }
}
