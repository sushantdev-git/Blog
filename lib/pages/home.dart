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
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
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
                height: 20,
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
