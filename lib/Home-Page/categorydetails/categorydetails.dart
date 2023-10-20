import 'package:flutter/material.dart';
import 'package:news/Home-Page/categories/category.dart';
import 'package:news/Home-Page/categorydetails/Soursestabswidget.dart';
import 'package:news/api/Apimaneger.dart';

class categorydetails extends StatelessWidget {
  Category category;

  categorydetails(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Apimaneger.getSources(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError || snapshot.data?.status == 'error') {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data?.message ?? snapshot.error.toString()),
                ],
              ),
            );
          }
          ElevatedButton(onPressed: () {}, child: Text('try again'));
          var Sourcelist = snapshot.data?.sources;
          return Sourcestabswidget(Sourcelist!);
        });
  }
}
