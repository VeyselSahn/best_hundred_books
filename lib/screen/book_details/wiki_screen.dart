import 'dart:io';

import 'package:best_hundred_books/core/constants/text_consstant.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiScreen extends StatefulWidget {
  final String wikiUrl;
  const WikiScreen({Key? key, required this.wikiUrl}) : super(key: key);

  @override
  State<WikiScreen> createState() => _WikiScreenState();
}

class _WikiScreenState extends State<WikiScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          TextConstant().title,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
      ),
      body: WebView(
        initialUrl: widget.wikiUrl,
      ),
    );
  }
}
