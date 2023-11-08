import 'package:flutter/material.dart';
import 'package:trainee/model/news_model.dart';
import 'package:trainee/utils/const.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.article});

  final NewsModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: ListView(children: [
        SizedBox(
          height: 200,
          child: Image.network(
            article.urlToImage ?? K.notFoundImageURL,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                article.title!,
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    article.author!,
                    textAlign: TextAlign.start,
                  ),
                  Column(
                    children: [
                      Text(DateTime.parse(article.publishedAt!).day.toString()),
                      Text("hour")
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Text(article.content!)
            ],
          ),
        )
      ]),
    );
  }
}
