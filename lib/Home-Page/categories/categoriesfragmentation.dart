import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Home-Page/categories/categorywidget.dart';

import 'category.dart';

typedef Onclickcategory = void Function(Category category);

class Categoriesfragment extends StatelessWidget {
  Onclickcategory onclickcategory;
  List<Category> categories = Category.getAllCategories(); // Declare as final
  Categoriesfragment(this.onclickcategory);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category \nof interest',
            style: GoogleFonts.poppins(
                fontSize: 22, fontWeight: FontWeight.bold,
              color: Color(0xFF4F5A69),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 24, mainAxisSpacing: 20, crossAxisCount: 2),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onclickcategory(categories[index]);
                  }, child: categoryitem(categories[index], index)),
              itemCount: categories.length,
            ),
          )
          // You can use the 'categories' list here to build your UI based on the categories.
        ],
      ),
    );
  }
}
