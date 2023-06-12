import 'package:flutter/material.dart';

Padding noteBoardMethod(Size _size, String title) {
  return Padding(
    padding: EdgeInsets.all(_size.width / 50),
    child: Container(
      padding: EdgeInsets.all(_size.width / 50),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color.fromARGB(255, 235, 158, 158),
          )),
      child: TextFormField(
        maxLines: 10,
        decoration: InputDecoration(border: InputBorder.none, hintText: title),
      ),
    ),
  );
}
