import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../ui/tab_bar_start_widget.dart';
import '../ui/widgets/auth/auth.dart';
import '../ui/widgets/components/wrapper_first_tab_screen.dart';
import '../ui/widgets/edit_profile/delete_profile.dart';
import '../ui/widgets/edit_profile/edit_email.dart';
import '../ui/widgets/edit_profile/edit_name.dart';
import '../ui/widgets/edit_profile/edit_surname.dart';
import '../ui/widgets/greeting/tab_bar_widget.dart';
import '../ui/widgets/greeting/widgets/greeting_auth.dart';
import '../ui/widgets/greeting/widgets/greeting_not_auth.dart';
import '../ui/widgets/loader_widget.dart';
import '../ui/widgets/my_progects_tab/my_progect_streambuilder.dart';
import '../ui/widgets/my_progects_tab/widgets/my_progects_auth_screen.dart';
import '../ui/widgets/my_progects_tab/widgets/my_progects_not_auth_screen.dart';
import '../ui/widgets/profile/profile.dart';
import '../ui/widgets/tarifs/tarifs.dart';
import '../ui/widgets/components/wrapper_second_tab_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoaderWidgetRoute.page, path: '/'),
        AutoRoute(
          page: GreetingWidgetRoute.page,
          path: '/root',
          children: [
            AutoRoute(
              page: ListWrapperSecondTabRoute.page,
              initial: true,
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
                  page: EditNameRoute.page,
                  path: 'editName',
                ),
                AutoRoute(
                  page: EditSurnameRoute.page,
                  path: 'editSurname',
                ),
                AutoRoute(
                  page: EditEmailRoute.page,
                  path: 'editEmail',
                ),
                AutoRoute(
                  page: DeleteProfileRoute.page,
                  path: 'deleteProfile',
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
                  page: TarifsWidgetRoute.page,
                  path: 'tarifs',
                ),
              ],
            ),
            AutoRoute(
                page: ListWrapperFirstTabRoute.page,
                children: [
                  AutoRoute(
                    page: MyProgectsStreamWidgetRoute.page,
                    path: 'myProgectsStreamRouteWidget',
                  ),
                ]),
          ],
        ),

        // AutoRoute(
        //   page: ProfileRoute.page,
        //   path: '/root/profile',
        // ),
      ];
}
