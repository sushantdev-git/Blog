import 'package:flutter/material.dart';

class BlogEntry extends StatefulWidget {
  const BlogEntry({Key? key}) : super(key: key);

  @override
  State<BlogEntry> createState() => _BlogEntryState();
}

class _BlogEntryState extends State<BlogEntry> {

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
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              constraints: const BoxConstraints(
                maxHeight: 200,
              ),
              child: const Center(
                child: Icon(Icons.camera_alt),
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
