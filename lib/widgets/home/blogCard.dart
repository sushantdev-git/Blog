import 'package:flutter/material.dart';
import 'package:home/pages/blogpage.dart';

class BlogCard extends StatelessWidget {
  BlogCard({Key? key,  required this.likes, required this.Title, required this.author}) : super(key: key);
  int likes;
  // String? image;
  String Title;
  String author;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
        onTap: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const BlogPage()));
        },
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: 'https://picsum.photos/250?image=9',
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.redAccent,
                      ),
                    ),
                    Text(
                      "${likes}",
                      style: const TextStyle(fontSize: 14),
                    )
                  ],
                ),
                title: Text(Title),
                subtitle: Text(author),
              ),
            ],
          ),
        ),
    ));
  }
}
