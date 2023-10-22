import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_architecture_bloc/src/config/router/app_router.dart';
import 'package:oktoast/oktoast.dart';

import 'src/config/themes/app_themes.dart';
import 'src/domain/repositories/api_repository.dart';
import 'src/locator.dart';
import 'src/presentation/cubits/remote_article/remote_articles_cubit.dart';
import 'src/utils/constans/string.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await initialzeDependecies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RemoteArticlesCubit(
              locator<ApiRepository>(),
            )..getBreakingNewArticles(),
          ),
        ],
        child: OKToast(
          child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
              title: appTitle,
              theme: AppTheme.light),
        ));
  }
}
