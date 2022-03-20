import 'package:flutter/material.dart';
import 'package:home/model/Blog.dart';
import 'package:home/widgets/home/home.dart';
import 'package:home/widgets/home/BlogEnter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final Screens = [const Home(), const BlogEntry()];
  @override
  Widget build(BuildContext context) {
    Provider.of<BlogListProvider>(context).fetchBlogs();
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          currentIndex: currentIndex,
          iconSize: 25,
          selectedFontSize: 16,
          // showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blueGrey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Add',
              backgroundColor: Colors.blueAccent,
            ),
          ],
        ),
        body: Screens[currentIndex]);
  }
}
