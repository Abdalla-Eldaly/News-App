import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  viewModel.loadSource(widget.category.id);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, CategoryDeyailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var sourceList = state.sourceList;
              return Sourcestabswidget(sourceList!);
            }
          case LoadingState():
            {
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text('Loading...')
                ],
              ));
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage ?? ""),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.loadSource(widget.category.id);
                        },
                        child: Text('try again')),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
