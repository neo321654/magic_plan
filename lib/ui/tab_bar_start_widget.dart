import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/resources/resources.dart';
import '../navigation/app_router.dart';
import '../main.dart';



@RoutePage()
class GreetingWidgetPage extends StatelessWidget {
  const GreetingWidgetPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    CupertinoTabController controller = CupertinoTabController(initialIndex: 1);
    //final viewModel = context.read<_ViewModel>();

    // return Text('dfdf');
    return AutoTabsRouter(
      routes: const [

        MainRouteWidgetRoute(),
        AuthInTabBarWidgetRoute(),

        // LoaderWidgetRoute(),
        GreetingNotAuthRoute(),
        ProfileRoute(),
        AuthGateRoute(),
        // GreetingAuthRoute(),
        // GreetingAuthRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return CupertinoTabScaffold(
          controller: controller,
          tabBar: CupertinoTabBar(
            onTap: tabsRouter.setActiveIndex,
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.dashboard_rounded),
                label: 'Мои проекты'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.person_solid),
                label: 'Мой аккаунт'.tr,
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return child;
          },
        );

      },
    );
  }

  Future<void> _signOut() async {
    await auth.signOut();
  }
}
