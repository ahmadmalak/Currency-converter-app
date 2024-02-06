// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:currency_converter_app/common/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide NavigationBar;
import 'package:injectable/injectable.dart';
export 'route.gr.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

@singleton
@AutoRouterConfig(
  replaceInRouteName: 'Page|Modal|Dialog|Scope,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        // /// routes go here
        AutoRoute(
          page: CurrencyConverterRoute.page,
          initial: true,
        ),
      ];
}
