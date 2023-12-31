import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';

import 'data/datasources/remote/news_api_services.dart';
import 'data/repositories/api_repositories_impl.dart';
import 'domain/repositories/api_repository.dart';

final locator = GetIt.instance;
Future<void> initialzeDependecies() async {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());
  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<NewsApiService>(NewsApiService(locator<Dio>()));

  locator.registerSingleton<ApiRepository>(
      ApiRepositoryImpl(locator<NewsApiService>()));
}
