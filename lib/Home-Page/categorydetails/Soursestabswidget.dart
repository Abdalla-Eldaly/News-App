import 'package:flutter/material.dart';
import 'package:news/Home-Page/categorydetails/tabwidget.dart';
import 'package:news/model/sourceResponse/Source.dart';
import 'package:news/news/Newslistwidget.dart';

class Sourcestabswidget extends StatefulWidget {
  List<Source> sources;
  Sourcestabswidget(this.sources, {Key? key}) : super(key: key);

  @override
  State<Sourcestabswidget> createState() => _SourcestabswidgetState();
}

int selectedindex = 0; // Define the selected index variable in the class.

class _SourcestabswidgetState extends State<Sourcestabswidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          TabBar(
              indicatorColor: Colors.transparent,
              onTap: (newindex) {
                selectedindex = newindex;
                setState(() {});
              },
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => tabwidget(
                      widget.sources.indexOf(source) == selectedindex, source))
                  .toList()),
          Expanded(child: NewsListWidget(widget.sources[selectedindex]))
        ],
      ),
    );
  }
}
