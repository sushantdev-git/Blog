import 'package:flutter/material.dart';

import 'blogCard.dart';
import 'filter/filterBar.dart';
class Home extends StatelessWidget {
  // final Size mediaQuery;
  const Home({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: mediaQuery.height,
      // width: mediaQuery.width,
      child: SingleChildScrollView(
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
            BlogCard(Title: "Some Title", likes: 100, author: "Sushant",),
            // BlogCard(),
            // BlogCard(),
            // BlogCard(),
            // BlogCard(),
            // BlogCard(),
          ],
        ),
      ),
    );
  }
}
