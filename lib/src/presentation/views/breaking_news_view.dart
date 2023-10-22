import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import '../../domain/models/article.dart';
import '../cubits/remote_article/remote_articles_cubit.dart';
import '../widgets/article_widgets.dart';
import '../../utils/extensions/scroll_controller.dart';

class BreakingNewsView extends HookWidget {
  const BreakingNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remoteArticlesCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndListener(() {
        remoteArticlesCubit.getBreakingNewArticles();
      });
      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daily News",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
        builder: (_, state) {
          log("${state.runtimeType}");
          switch (state.runtimeType) {
            case RemoteArticlesLoading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case RemoteArticlesFailed:
              return const Center(
                child: Icon(Ionicons.refresh),
              );
            case RemoteArticlesSuccess:
              return _buildArticles(
                scrollController,
                state.articles,
                state.noMoreData,
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildArticles(ScrollController scrollController,
      List<Article> articles, bool noMoreData) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ArticleWidget(article: articles[index]),
            childCount: articles.length,
          ),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          ),
      ],
    );
  }
}
