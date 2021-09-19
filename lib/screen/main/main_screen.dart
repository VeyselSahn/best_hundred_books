import 'package:best_hundred_books/core/models/book_model.dart';
import 'package:best_hundred_books/core/service/data_service.dart';
import 'package:best_hundred_books/screen/main/component/component_shelf.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final DataService service;
  const MainScreen({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newIndex = service.index;
    List<BookModel> books = service.bookList;
    return Scaffold(
      appBar: appbar(context, service),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          service.index != 0
              ? Flexible(flex: 1, child: pageChanger(service, false))
              : SizedBox(
                  height: 0,
                ),
          Flexible(flex: 15, child: body(context, books, newIndex)),
          service.bookList.length != service.index + 20
              ? Flexible(flex: 1, child: pageChanger(service, true))
              : SizedBox(
                  height: 0,
                )
        ],
      ),
    );
  }

  Widget body(BuildContext context, List<BookModel> books, int newIndex) {
    return CustomScrollView(slivers: <Widget>[
      SliverPadding(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.72),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return bookTile(context, books[index + newIndex]);
            },
            childCount: 20,
          ),
        ),
      ),
    ]);
  }
}
