import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/Blog.dart';

class FilterCard extends StatelessWidget {
  final String cardName;
  final bool selected;
  final Function setSelected;
  final int FilerNo;
  const FilterCard({Key? key, required this.cardName, required this.selected, required this.setSelected, required this.FilerNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _blogProvider = Provider.of<BlogListProvider>(context);
    return GestureDetector(
      onTap: () {
        _blogProvider.filterBlog(cardName);
        setSelected(FilerNo);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? Colors.white : Colors.grey,
            width: selected ? 0 : 1,
          ),
          color: selected ? Colors.blueGrey : null,
        ),
        child: Text(
          cardName,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),

      ),
    );
  }
}
