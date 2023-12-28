import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/auth/auth.dart';
import '../widgets/greeting/greeting_widget.dart';
import '../widgets/greeting/widgets/greeting_auth.dart';
import '../widgets/greeting/widgets/greeting_not_auth.dart';
import '../widgets/loader_widget.dart';
import '../widgets/profile/profile.dart';
import '../widgets/tab_bar_widget.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoaderWidgetRoute.page, path: '/'),
        AutoRoute(page: GreetingWidgetRoute.page, path: '/root', children: [
          AutoRoute(
            page: AuthGateRoute.page,
            path: 'auth',
          ),
          AutoRoute(
            page: ProfileRoute.page,
            path: 'profile',
          ),
          AutoRoute(
            page: GreetingNotAuthRoute.page,
            path: 'noAuth',
          ),
          AutoRoute(
            page: GreetingAuthRoute.page,
            path: 'authIn',
          ),
          AutoRoute(
            page: AuthInTabBarWidgetRoute.page,
            path: 'authInTabBar',
            initial: true,
          ),
        ]),
      ];
}
