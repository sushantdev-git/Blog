import 'package:flutter/material.dart';
import 'package:home/model/Blog.dart';
import 'package:provider/provider.dart';

import 'blogCard.dart';
import 'filter/filterBar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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
              FilterBar(),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
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
              itemCount: arr.length,
              itemBuilder: (context, index) {
                var i = arr[index];

                return BlogCard(
                    Title: i['title'], likes: i['likes'], author: i['author']);
              }),
        )
      ],
    );
  }
}
