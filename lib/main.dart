import 'package:flutter/material.dart';
import 'package:flutter_news/screens/news_list.dart';
import 'package:flutter_news/widgets/app_drawer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: const Text('Top Headlines'),
        ),
        body: NewsList(),
      ),
    );
  }
}
