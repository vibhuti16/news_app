import 'package:flutter/material.dart';

import '../pages/category/favorites_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/news_app.dart';
import '../pages/news_detail/news_detail_page.dart';
import '../pages/profile/profile_page.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoute(){
    return  <String, WidgetBuilder>{
          '/': (_) => NewsApp(),
          '/home': (_) => HomePage(),
          '/detail': (_) => NewsDetailPage(),
          '/category': (_) => CategoryPage(),
          '/profile': (_) => const ProfilePage(),
        };
  }
}