import 'package:flutter/material.dart';
import 'package:news/Home-Page/Homepage.dart';

class Splashscreen extends StatelessWidget {
  static String RouteName = 'splashscreen';



  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(Homepage.RouteName);
    });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
