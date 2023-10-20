import 'dart:ui';
import 'package:flutter/foundation.dart';

class Category {
  String id;
  String title;
  Color color;
  String imagename;

  Category(this.id, this.title, this.color, this.imagename);

  static List<Category> getAllCategories() {
    return [
      Category('sports', 'Sports', Color(0xFFC91C22), 'sports.png'),
      Category('general', 'General', Color(0xFF003E90), 'Politics.png'),

      Category('health', 'Health', Color(0xFFED1E79), 'health.png'),


      Category('business', 'Business', Color(0xFFCF7E48), 'business.png'),

      Category('entertainment', 'Entertainment', Color(0xFF4882CF), 'entertainment.png'),

      Category('science', 'Science', Color(0xFFF2D352) , 'science.png'),

      // Add more categories as needed
    ];
  }
}
