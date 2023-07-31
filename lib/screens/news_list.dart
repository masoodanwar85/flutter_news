import 'package:flutter/material.dart';
import 'package:flutter_news/models/news.dart';
import 'package:flutter_news/screens/news_detail.dart';
import 'package:flutter_news/service/http_service.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key});

  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          // News news = snapshot.data as News;
          List<Articles> articles = snapshot.data?.articles as List<Articles>;
          // News<List<Articles>>? articles = snapshot.data.articles;
          return Ink(
            color: Colors.grey[300],
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Center(
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(
                              articles[index].title.toString(),
                            ),
                            titleTextStyle:
                                const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.all(5),
                            subtitle: Text(
                              articles[index].author ?? 'No Author',
                            ),
                            subtitleTextStyle:
                                const TextStyle(color: Colors.blue),
                          ),
                          Text(
                            articles[index].publishedAt.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            child: FadeInImage(
                              image: NetworkImage(
                                  articles[index].urlToImage.toString()),
                              placeholder: const AssetImage(
                                  'assets/placeholder_600x400.png'),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                    'assets/placeholder_600x400.png',
                                    fit: BoxFit.fitWidth);
                              },
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          // const ClipRRect(
                          //   child: Image(
                          //       image: AssetImage(
                          //           'assets/placeholder_600x400.png')),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                articles[index].description.toString(),
                                style: const TextStyle(
                                    fontSize: 12, fontStyle: FontStyle.italic),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewsDetail(
                                            article: articles[index])));
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue),
                              child: const Text(
                                'View Details',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: articles.length),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
