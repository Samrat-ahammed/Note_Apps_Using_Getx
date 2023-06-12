import 'package:flutter/material.dart';

AppBar appBarMethod(String title) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 53, 75, 58).withGreen(100),
    title: Text(
      title,
      style: const TextStyle(color: Color.fromARGB(255, 222, 141, 141)),
    ),
  );
}
