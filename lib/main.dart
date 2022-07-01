import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/navigation/bloc/bloc.dart';
import 'package:news_app/src/pages/news_app.dart';
import 'package:news_app/src/theme/bloc/bloc.dart';
import 'package:news_app/src/theme/color/dark_color.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:splashscreen/splashscreen.dart';
import 'src/helpers/routes.dart';
import 'src/pages/home_page/bloc/bloc.dart';
import 'src/pages/news_detail/bloc/bloc.dart';
import 'src/resources/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ThemeData appTheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) =>
              NewsBloc(repository: Repository())..add(Fetch(type: 'General')),
        ),
        BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is SelectedTheme) {
            appTheme = state.themeType != ThemeType.Light
                ? AppTheme.lightTheme
                : AppTheme.darkTheme;
          }
          return Builder(
            builder: (context) {
              return MaterialApp(
                title: 'Splash Screen',
                theme: appTheme,
                debugShowCheckedModeBanner: false,
                home: Splash(),
                // routes: Routes.getRoute(),
              );
            },
          );
        },
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3),
//             ()=>Navigator.pushReplacement(context,
//             MaterialPageRoute(builder:
//                 (context) =>
//                 NewsApp()
//             )
//         )
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.white,
//         child:Image.asset("assets/logos/splash_screen_logo.png", width:25,height: 25,)
//     );
//   }
// }

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new NewsApp(),
      image: new Image.asset("assets/logos/splash_screen_logo.png"),
      photoSize: 100.0,
      loaderColor: DarkColor.lightpurple,
    );
  }
}


