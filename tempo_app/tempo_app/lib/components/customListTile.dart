import 'package:flutter/material.dart';
import 'package:tempo_app/model/article_model.dart';
import 'package:tempo_app/pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(article: article)));
    },
    child: Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
            )
          ]),
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
            article.title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    ),
  );
}
