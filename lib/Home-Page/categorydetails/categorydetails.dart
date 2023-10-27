import 'package:flutter/material.dart';
import 'package:news/Home-Page/categories/category.dart';
import 'package:news/Home-Page/categorydetails/CategoryDetailsViewModel.dart';
import 'package:news/Home-Page/categorydetails/Soursestabswidget.dart';
import 'package:news/api/Apimaneger.dart';
import 'package:provider/provider.dart';

class categorydetails extends StatefulWidget {
  Category category;

  categorydetails(this.category, {super.key});

  @override
  State<categorydetails> createState() => _categorydetailsState();
}

class _categorydetailsState extends State<categorydetails> {
  var viewModel = CategoryDetailsViewModel();
@override
  void initState() {
  viewModel.getSouce(widget.category.id);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, value, child) {
          if (viewModel.showLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                children: [
                  Text(viewModel.errorMessage ?? ""),
                ],
              ),
            );
          }
          ElevatedButton(onPressed: () {
            viewModel.getSouce(widget.category.id);
          }, child: Text('try again'));
          var Sourcelist = viewModel.listSource;
          return Sourcestabswidget(Sourcelist!);
        },
      ),
    );
  }
}
