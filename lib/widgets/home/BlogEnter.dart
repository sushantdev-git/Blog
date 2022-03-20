import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/model/AddBlog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BlogEntry extends StatefulWidget {
  const BlogEntry({Key? key}) : super(key: key);

  @override
  State<BlogEntry> createState() => _BlogEntryState();
}

class _BlogEntryState extends State<BlogEntry> {
  File ? image;

  Future pickImage(AddBlog blogProvider) async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      blogProvider.setImage(imageTemp);
      setState(() {
        this.image = blogProvider.image;
      });
    }
    on PlatformException catch (e){
      // print("image loading failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _blogProvider = Provider.of<AddBlog>(context);
    image = _blogProvider.image;
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
                      pickImage(_blogProvider);
                    },
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              onChanged: (value) {
                _blogProvider.setTitle(value);
              },
              initialValue: _blogProvider.title,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              minLines: 1,
              maxLines: 100,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Content',
              ),
              onChanged: (value) {
                _blogProvider.setContent(value);
              },
              initialValue: _blogProvider.content,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  minimumSize: Size(100,40),
                ),
                onPressed: () {  }, child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
