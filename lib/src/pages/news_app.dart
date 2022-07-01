import 'package:flutter/material.dart';

import '../widget/bottom_navigation_bar.dart';
import 'category/favorites_page.dart';
import 'home_page/home_page.dart';
import 'profile/profile_page.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(controller: _controller),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          // VideoNewsPage(),
          CategoryPage(
            controller: _controller,
          ),
          ProfilePage(),
        ],
      ),
    );
  }
}
