import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '../../navigation/app_router.dart';
import '../../../main.dart';



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
        // GreetingNotAuthRoute(),
        AuthGateRoute(),
        AuthInTabBarWidgetRoute(),

        // LoaderWidgetRoute(),

        // ProfileRoute(),
        // GreetingAuthRoute(signOut: _signOut),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return CupertinoTabScaffold(
          controller: controller,
          tabBar: CupertinoTabBar(
            onTap: tabsRouter.setActiveIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.star_fill),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.clock_solid),
                label: 'Recents',
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
