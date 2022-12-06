import 'package:flutter/material.dart';
import 'package:tempo_app/model/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage.toString()),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12)),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.all(6),
              child: Text(article.source.name.toString()),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              article.description.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
