import 'package:flutter/material.dart';
import 'package:home/model/Blog.dart';
import 'package:provider/provider.dart';

import 'blogCard.dart';
import 'filter/filterBar.dart';

class Home extends StatelessWidget {
  // final Size mediaQuery;
  const Home({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arr = Provider.of<BlogListProvider>(context).blogs;
    return Column(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Discover",
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
              const FilterBar(),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "Recent Blogs",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: arr.length,
              itemBuilder: (context, index) {
                var i = arr[index];
                return BlogCard(
                    body: i['body'],
                    image: i['image'],
                    Title: i['title'],
                    likes: i['likes'],
                    author: i['author']);
              }),
        )
      ],
    );
  }
}
