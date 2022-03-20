import 'package:flutter/material.dart';
import './filterCard.dart';

class FilterBar extends StatefulWidget {
  // final double ? width;
  const FilterBar({Key? key,}) : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  int selected = 0;

  void setSelected(int val){
    setState(() {
      selected = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          FilterCard(cardName: "All", selected: selected == 0, setSelected: setSelected, FilerNo: 0,),
          FilterCard(cardName: "Idea",selected: selected == 1, setSelected: setSelected, FilerNo: 1,),
          FilterCard(cardName: "Value", selected: selected == 2, setSelected: setSelected, FilerNo: 2,),
          FilterCard(cardName: "Awareness", selected: selected == 3, setSelected: setSelected, FilerNo: 3,),
          FilterCard(cardName: "Education",selected: selected == 4, setSelected: setSelected, FilerNo: 4,),
        ],
      ),
    );
  }
}
