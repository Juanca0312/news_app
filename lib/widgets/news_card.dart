import 'package:flutter/material.dart';
import 'package:trainee/model/news_model.dart';
import 'package:trainee/utils/const.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});

  final NewsModel article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: SizedBox(
                height: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    article.urlToImage ?? K.notFoundImageURL,
                    fit: BoxFit.fitHeight,
                  ),
                )),
          ),
          Flexible(flex: 2, fit: FlexFit.tight, child: _infoSection())
        ],
      ),
    );
  }

  Container _infoSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Builder(builder: (context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Text(
                  article.title ?? "-",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleMedium!,
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("By ${article.author}",
                      style: Theme.of(context).textTheme.labelMedium!),
                  Text(article.source?.name ?? '-',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Color(0xff69BDFD))),
                  Text(article.publishedAt ?? '--',
                      style: Theme.of(context).textTheme.labelMedium!),
                ],
              ))
            ]);
      }),
    );
  }
}
