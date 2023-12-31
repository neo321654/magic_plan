import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../ui/tab_bar_start_widget.dart';
import '../ui/widgets/auth/auth.dart';
import '../ui/widgets/greeting/tab_bar_widget.dart';
import '../ui/widgets/greeting/widgets/greeting_auth.dart';
import '../ui/widgets/greeting/widgets/greeting_not_auth.dart';
import '../ui/widgets/loader_widget.dart';
import '../ui/widgets/maintab/main_screen.dart';
import '../ui/widgets/profile/profile.dart';
import '../ui/widgets/wrapper_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoaderWidgetRoute.page, path: '/'),
        // AutoRoute(page: LoaderWidgetRoute.page, path: '/zz'),

        // AutoRoute(
        //   page: ProfileRoute.page,
        //   path: '/',
        // ),
        AutoRoute(
          page: GreetingWidgetRoute.page,
          path: '/root',
          children: [
            AutoRoute(
              page: ListWrapperRoute.page,
              children: [
                AutoRoute(
                  page: AuthInTabBarWidgetRoute.page,
                  path: 'authInTabBar',
                  initial: true,
                ),
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
              ],
            ),
            AutoRoute(
              page: MainRouteWidgetRoute.page,
              path: 'mainRouteWidget',
            ),
          ],
        ),



    // AutoRoute(
    //   page: ProfileRoute.page,
    //   path: '/root/profile',
    // ),
      ];
}
