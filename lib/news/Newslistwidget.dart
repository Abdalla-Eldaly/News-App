import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/Apimaneger.dart';
import 'package:news/model/sourceResponse/Source.dart';
import 'package:provider/provider.dart';

import 'NewsListViewModel.dart';
import 'newswidget.dart';


class NewsListWidget extends StatefulWidget {
 Source source;
  NewsListWidget(this.source, {super.key});


  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
var viewModel = NewsListViewModel();
@override
  void initState() {
    super.initState();
    viewModel.loadNews(widget.source.id);
  }
  @override
  Widget build(BuildContext context) {


    return BlocBuilder<NewsListViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var newsList = state.newsList;

            return ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsWidget(newsList![index]);
                  },
                  itemCount: newsList?.length ?? 0,
                );
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
                          viewModel.loadNews(widget.source.id);
                        },
                        child: Text('try again')),
                  ],
                ),
              );
            }
        }
      },
    );


    // call api
    // return FutureBuilder(
    //   future: Apimaneger.getnews(source.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.data?.status == 'error' || snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data?.message ?? snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = snapshot.data?.articles;
    //
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsWidget(newsList![index]);
    //       },
    //       itemCount: newsList?.length ?? 0,
    //     );
    //   },
    // );






  }
}