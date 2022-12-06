import 'package:flutter/material.dart';
import 'package:tempo_app/components/customListTile.dart';
import 'package:tempo_app/main.dart';
import 'package:tempo_app/majalah_page.dart';
import 'package:tempo_app/services/api_service.dart';

import 'model/article_model.dart';

class KoranPage extends StatefulWidget {
  const KoranPage({super.key});

  @override
  State<KoranPage> createState() => _KoranPage();
}

class _KoranPage extends State<KoranPage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TEMPO",
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Container(
              height: 3,
              color: Colors.red,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 95,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      },
                      child: Text(
                        'PILIHAN',
                        style: TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123),
                          fontSize: 13,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 95,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return MajalahPage();
                        }));
                      },
                      child: Text(
                        'MAJALAH',
                        style: TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123),
                          fontSize: 13,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 94,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'KORAN',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 94,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'ENGLISH',
                        style: TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123),
                          fontSize: 13,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) =>
                  customListTile(articles![index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
