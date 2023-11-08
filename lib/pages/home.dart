import 'package:flutter/material.dart';
import 'package:trainee/model/news_model.dart';
import 'package:trainee/pages/detail.dart';
import 'package:trainee/services/news_service.dart';
import 'package:trainee/utils/const.dart';
import 'package:trainee/widgets/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsModel> news = [];
  NewsService newsService = NewsService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNews();
  }

  void _getNews() async {
    print("Obteniendo noticias");
    news = await newsService.getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: news.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : _newsContent(),
      ),
    );
  }

  ListView _newsContent() {
    return ListView.separated(
      itemCount: news.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailPage(
                      article: news[index],
                    )));
          },
          child: NewsCard(
            article: news[index],
          ),
        );
      }),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1.0,
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/newsLogo 1.png"),
          const SizedBox(width: 10.0),
          const Text(
            "Netforemost News",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
