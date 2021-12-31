import 'package:flutter/material.dart';
import 'package:app/pages/page_source.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "STT", home: PageSource());
  }
}
