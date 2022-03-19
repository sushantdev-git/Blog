import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2)
            ),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Title",
                      labelStyle: TextStyle(color: Colors.black38),
                      hintText: "Enter todo",
                      errorStyle: TextStyle(
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
