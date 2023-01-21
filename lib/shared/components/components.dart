import 'package:flutter/material.dart';
import 'package:news_app/modules/web_veiw/web_veiw.dart';

Widget builditem(article, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => web_veiw(url: article['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${article['title']} ',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
Widget separator() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[300],
    );
