import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/helpers/app_constants.dart';
import '../../models/newsResponseModel.dart';
import '../../theme/theme.dart';
import '../../widget/custom_image.dart';
import '../news_detail/bloc/bloc.dart';
import 'bloc/bloc.dart';
import 'widget/news_card.dart';

class HomePage extends StatelessWidget {
  Widget _headerNews(Article article) {
    return Builder(
      builder: (context) {
        return InkWell(
            onTap: () {
              final detailBloc = BlocProvider.of<DetailBloc>(context);
              detailBloc.add(SelectNewsForDetail(article: article));
              Navigator.pushNamed(context, '/detail');
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Hero(
                  tag: 'headerImage',
                  child: article.urlToImage == null
                      ? Container()
                      : CustomImage(article.urlToImage!),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 10, bottom: 20, top: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent],
                      // stops: [.1, .9],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(article.title!,
                          style: AppTheme.h4Style.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface)),
                      Text(
                        article.getTime(),
                        style: AppTheme.subTitleStyle.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget _body(
    BuildContext context,
    List<Article> list, {
    String? type,
  }) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            "$type".toUpperCase(),
            style: AppTheme.h2Style
                .copyWith(color: Theme.of(context).colorScheme.primaryVariant),
          ),
          backgroundColor: Theme.of(context).bottomAppBarColor,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: _headerNews(list.first),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => NewsCard(
                      artical: list[index],
                      type: type?.toUpperCase(),
                    ),
                childCount: list.length))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).backgroundColor,
        statusBarColor: Theme.of(context).backgroundColor));
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state == null) {
              return Center(child: Text('Null block'));
            }
            if (state is Failure) {
              return Center(child: Text('Something went wrong'));
            }
            if (state is Loaded) {
              if (state.items == null || state.items.isEmpty) {
                return Text('No content avilable');
              } else {
                return _body(context, state.items as List<Article>, type: state.type);
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
