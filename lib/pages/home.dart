import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainee/view_model/news_vm.dart';
import 'package:trainee/widgets/news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsVM = Provider.of<NewsVM>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _newsContent(newsVM),
      ),
    );
  }

  ListView _newsContent(NewsVM newsController) {
    return ListView.separated(
      itemCount: newsController.news.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            newsController.navigateToDetail(newsController.news[index]);
          },
          child: NewsCard(
            article: newsController.news[index],
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
