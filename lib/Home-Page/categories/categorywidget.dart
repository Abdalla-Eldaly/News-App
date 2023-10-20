import 'package:flutter/material.dart';
import 'package:news/Home-Page/categories/category.dart';

class categoryitem extends StatelessWidget{
  Category category;
  int index;
   categoryitem(this.category,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomRight: Radius.circular( index.isEven?0:24),
          bottomLeft: Radius.circular(index.isEven?24:0),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset('assets/images/${category.imagename}',

            ),
          ),
          Expanded(
            flex: 1,
            child: Text(category.title,style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),),
          ),
        ],
      ),
    );
  }
}
