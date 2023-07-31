import 'package:flutter/material.dart';
import 'package:flutter_news/models/news.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsDetail extends StatelessWidget {
  final Articles article;
  const NewsDetail({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: Column(
        children: [
          FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: article.urlToImage.toString()),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  article.title.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  article.content.toString(),
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  article.description.toString(),
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
