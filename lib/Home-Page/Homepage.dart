import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Home-Page/categories/categoriesfragmentation.dart';
import 'package:news/Home-Page/categories/category.dart';
import 'package:news/Home-Page/categorydetails/categorydetails.dart';
import 'package:news/Home-Page/setting/settingfragment.dart';

import 'HomeDrawer.dart';

class Homepage extends StatefulWidget {
  static String RouteName = 'homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedwidget = Categoriesfragment(oncategoryclickitem);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        drawer: HomeDrawer(onmeuichooesed),
        appBar: AppBar(
          title: Text('News', style: GoogleFonts.poppins(
            fontSize: 22
          ),),
        ),
        body: selectedwidget,
      ),
    );
  }

 late Widget selectedwidget ;

  void onmeuichooesed(menuitemclicked item) {
    Navigator.pop(context);
    switch (item) {
      case menuitemclicked.categoreitem:
        {
          setState(() {
            selectedwidget = Categoriesfragment(oncategoryclickitem);
          });
        }
      case menuitemclicked.settingitem:
        {
          setState(() {
            selectedwidget = Settingfragment();
          });
        }

        setState(() {});
    }
  }
  void oncategoryclickitem(Category category){
    selectedwidget = categorydetails(category);
    setState(() {

    });
  }
}
