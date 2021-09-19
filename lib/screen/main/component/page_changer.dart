import 'package:best_hundred_books/core/constants/constant_shelf.dart';
import 'package:best_hundred_books/core/service/data_service.dart';
import 'package:flutter/material.dart';

Padding pageChanger(DataService service, bool isNext) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: GestureDetector(
      onTap: () =>
          isNext == true ? service.setIndex(20) : service.setIndex(-20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isNext == true
                  ? TextConstant().nextPage
                  : TextConstant().previousPAge,
              style: TextStyle(fontSize: 15),
            ),
            Icon(isNext == true ? Icons.arrow_forward : Icons.arrow_back)
          ],
        ),
      ),
    ),
  );
}
