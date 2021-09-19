import 'package:auto_size_text/auto_size_text.dart';
import 'package:best_hundred_books/core/constants/text_consstant.dart';
import 'package:best_hundred_books/core/models/book_model.dart';
import 'package:best_hundred_books/core/provider/theme_provider.dart';
import 'package:best_hundred_books/screen/book_details/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget bookTile(BuildContext context, BookModel book) {
  var response = book.imageLink!.replaceFirst(RegExp(r'file:///'), '');
  final double boxImageSize =
      ((MediaQuery.of(context).size.width) - 48) / 2 - 12;
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2,
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(response,
                  width: boxImageSize, height: boxImageSize)),
          Container(
            margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Center(
              child: AutoSizeText(
                book.title.toString(),
                style: TextStyle(fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    context.watch<ThemeProvider>().theme.primaryColorDark)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(book: book, image: response),
                  ));
            },
            child: Text(TextConstant().detail),
          )
        ],
      ),
    ),
  );
}
