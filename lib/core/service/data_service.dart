import 'dart:convert';

import 'package:best_hundred_books/core/constants/data_constant.dart';
import 'package:best_hundred_books/core/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

class DataService extends ChangeNotifier {
  bool loading = true;
  late INetworkManager manager;
  List<BookModel> bookList = [];

  int index = 0;
  void setIndex(int newIndex) {
    index = index + newIndex;
    notifyListeners();
  }

  void getData() async {
    changeLoading(true);
    manager = NetworkManager(
        options: BaseOptions(baseUrl: DataConstant.instance.baseUrl),
        isEnableLogger: false);
    final response = await manager.send<BookModel, EmptyModel>(
        DataConstant.instance.endPoint,
        parseModel: BookModel(),
        method: RequestType.GET);

    List decoded = jsonDecode(response.data!.name ?? '');
    bookList = decoded.map((e) => BookModel.fromJson(e)).toList();
    changeLoading(false);
  }

  void changeLoading(bool newL) {
    loading = newL;
    notifyListeners();
  }
}
