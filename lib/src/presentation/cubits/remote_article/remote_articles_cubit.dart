import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/article.dart';
import '../../../domain/models/requests/breaking_news_request.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../utils/constans/nums.dart';
import '../../../utils/resources/data_state.dart';
import '../base/base_cubit.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit
    extends BaseCubit<RemoteArticlesState, List<Article>> {
  final ApiRepository _apiRepository;
  RemoteArticlesCubit(this._apiRepository)
      : super(const RemoteArticlesLoading(), []);

  int _page = 1;

  Future<void> getBreakingNewArticles() async {
    if (isBusy) return;
    await run(
      () async {
        final response = await _apiRepository.getBreakingNewsArticle(
            request: BreakingNewsRequest(page: _page));

        if (response is DataSuccess) {
          final articles = response.data!.articles;
          final noMoreData = articles.length < defaultPageSize;

          data.addAll(articles);

          _page < 5 ? _page++ : null;
          emit(RemoteArticlesSuccess(articles: data, noMoreData: noMoreData));
        } else if (response is DataFailed) {
          emit(RemoteArticlesFailed(error: response.error));
        }
      },
    );
  }
}
