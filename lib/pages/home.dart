import 'package:flutter/material.dart';
import '../widgets/home/filter/filterBar.dart';
import '../widgets/home/blogCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
      body: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width,
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
              FilterBar(width: mediaQuery.width,),
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
              BlogCard(),
              BlogCard(),
              BlogCard(),
              BlogCard(),
              BlogCard(),
              BlogCard(),
            ],
          ),
        ),
      ),
    );
  }
}
