import 'package:flutter/material.dart';

snkbr(String text, context) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
