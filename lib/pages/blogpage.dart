import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black45,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.9),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Image.network(
              'https://assets.gadgets360cdn.com/pricee/assets/product/202110/1Scam1992-250_1634118650.jpg',
              fit: BoxFit.cover,
            ),
          ), //image
          Container(
            padding: EdgeInsets.all(22),
            // color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Text(
              'Chitakara',
              style: GoogleFonts.getFont('Poppins').copyWith(
                fontSize: 20,
              ),
            ),
          ), //title
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Text(
                "Lorem ipsum dolor sit amet. Qui quia officiis est galisum fugiat et inventoreLorem ipsum dolor sit amet. Qui quia officiis est galisum fugiat et inventoreLorem ipsum dolor sit amet. Qui quia officiis est galisum fugiat et inventoreLorem ipsum dolor sit amet. Qui quia officiis est galisum fugiat et inventoreLorem ipsum dolor sit amet. Qui quia officiis est galisum fugiat et inventore sequi eos magni facilis in velit molestias et numquam doloribus. Eos nihil magnam aut quos rerum eum dolorum reiciendis non consequuntur optio nam maxime numquam sit perferendis minima ut maxime rerum? Quo ipsum fugit aut quas necessitatibus ea maiores harum aut eius velit ut dolor molestiae vel earum mollitia! Aut sunt velit sed autem possimus aut consequuntur autem."),
          ), //body
          // comments
        ],
      ),
    );
  }
}
