import 'package:flutter/material.dart';
import '../widgets/home/filter/filterBar.dart';
import '../widgets/home/blogCard.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference users = FirebaseFirestore.instance.collection('blog');
  Future<List> getDocs() async {
    QuerySnapshot querySnapshot = await users.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    setState(() {
      listofdata = allData;
    });
    return allData;
  }

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({'full_name': "love"})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void converttolist() async {
    listofdata = await getDocs();
    setState(() {
      // print(listofdata[0].author);
      print("ho gya");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDocs();
    // converttolist();
  }

  List listofdata = [];

  @override
  Widget build(BuildContext context) {
    // print(listOfData[0].title);
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Write',
            backgroundColor: Colors.purple,
          ),
        ],
      ),
      body: listofdata.length == 0
          ? Container()
          : SizedBox(
              height: mediaQuery.height,
              width: mediaQuery.width,
              child: Column(
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
                        FilterBar(
                            // width: mediaQuery.width,
                            ),
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
                        itemCount: listofdata.length,
                        itemBuilder: (context, index) {
                          var i = listofdata[index];

                          return BlogCard(
                              Title: i['title'],
                              likes: i['likes'],
                              author: i['author']);
                        }),
                  )
                ],
              ),
            ),
    );
  }
}
