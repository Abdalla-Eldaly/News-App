import 'package:flutter/material.dart';
import 'package:news/model/sourceResponse/Source.dart';

class tabwidget extends StatelessWidget {
  Source source;

  bool isselected;
  tabwidget(this.isselected, this.source, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13,vertical: 5),
      decoration: BoxDecoration(
          color: isselected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Text(
        source.name??"",
        style: TextStyle(
            color: isselected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
