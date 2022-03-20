import 'package:flutter/material.dart';
import './filterCard.dart';

class FilterBar extends StatelessWidget {
  // final double ? width;
  const FilterBar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const [
          FilterCard(cardName: "All"),
          FilterCard(cardName: "Idea"),
          FilterCard(cardName: "Value"),
          FilterCard(cardName: "Awareness"),
          FilterCard(cardName: "Education"),
        ],
      ),
    );
  }
}
