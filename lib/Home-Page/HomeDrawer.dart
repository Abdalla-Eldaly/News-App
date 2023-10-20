import 'package:flutter/material.dart';

typedef Onmenuitemclick = void Function(menuitemclicked itemclick);

class HomeDrawer extends StatefulWidget {
  Onmenuitemclick onClickedItem; // Use 'final' and initialize in the constructor

  HomeDrawer(this.onClickedItem);
  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
 // Constructor to initialize onClickedItem
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            height: 150,
            alignment: Alignment.center,
            child: Text(
              'News App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
            child: InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Categories',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
              onTap: () {
                // Call the callback when the Categories item is clicked
                widget.onClickedItem(menuitemclicked.categoreitem);
              },
            ),
            alignment: Alignment.topLeft,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
            child: InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Setting',
                    style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                // Call the callback when the Setting item is clicked
                widget.onClickedItem(menuitemclicked.settingitem);
              },
            ),
            alignment: Alignment.topLeft,
          ),
        ],
      ),
    );
  }
}
enum menuitemclicked{
categoreitem,
  settingitem
}