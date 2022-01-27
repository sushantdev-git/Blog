import 'package:flutter/material.dart';
import './filterCard.dart';

class FilterBar extends StatelessWidget {
  final double ? width;
  const FilterBar({Key? key,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          FilterCard(cardName: "Comedy"),
          FilterCard(cardName: "Adventure"),
          FilterCard(cardName: "Cosmos"),
          FilterCard(cardName: "Comedy"),
          FilterCard(cardName: "Adventure"),
        ],
      ),
    );
  }
}
