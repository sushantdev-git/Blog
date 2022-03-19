import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  final String cardName;
  const FilterCard({Key? key, required this.cardName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
        color: Colors.grey,
        width: 1,
       ),
      ),
      child: Text(
        cardName,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
