import 'package:flutter/material.dart';
import 'package:home/pages/blogpage.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BlogPage())),
        child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
          ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: (){
              }, icon: const Icon(Icons.favorite_border, color: Colors.redAccent,),),
              Text("200", style: TextStyle(fontSize: 14),)
            ],
          ),
          title: Text('The Enchanted Nightingale'),
          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
        ],
        ),
        ),
    ));
  }
}
