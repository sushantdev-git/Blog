import 'package:flutter/material.dart';

import 'package:home/pages/blogpage.dart';
import 'package:flutter/material.dart';
import 'package:home/pages/blogpage.dart';
import 'package:home/pages/login.dart';
// import './pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:home/model/AddBlog.dart';
import 'package:home/pages/homePage.dart';
import 'package:provider/provider.dart';
import 'package:home/model/Blog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BlogListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddBlog(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Blog',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
  }
}
