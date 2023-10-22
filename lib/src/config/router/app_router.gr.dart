// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    BreakingNewsViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const BreakingNewsView(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          BreakingNewsViewRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [BreakingNewsView]
class BreakingNewsViewRoute extends PageRouteInfo<void> {
  const BreakingNewsViewRoute()
      : super(
          BreakingNewsViewRoute.name,
          path: '/',
        );

  static const String name = 'BreakingNewsViewRoute';
}
