import 'package:auto_size_text/auto_size_text.dart';
import 'package:best_hundred_books/core/constants/constant_shelf.dart';
import 'package:best_hundred_books/core/models/book_model.dart';
import 'package:best_hundred_books/core/provider/theme_provider.dart';
import 'package:best_hundred_books/screen/book_details/wiki_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final BookModel book;
  final String image;
  const DetailScreen({Key? key, required this.book, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(context));
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.asset(image),
          ),
          Center(
            child: Text(
              book.title ?? '',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: getText(book.author),
          ),
          ListTile(
            leading: Icon(Icons.date_range),
            title: getText(book.year.toString()),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: getText(book.language),
          ),
          ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      context.watch<ThemeProvider>().theme.primaryColorDark)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WikiScreen(wikiUrl: book.link ?? ''),
                    ));
              },
              icon: Icon(FontAwesomeIcons.wikipediaW),
              label: Text(TextConstant().wiki))
        ],
      ),
    );
  }

  AutoSizeText getText(info) {
    return AutoSizeText(
      info,
      style: TextStyle(fontSize: 18),
    );
  }
}
