import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '/resources/resources.dart';
import '../navigation/app_router.dart';
import '../main.dart';

@RoutePage()
class GreetingWidgetPage extends StatelessWidget {
  const GreetingWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo убрать stack когда буду удалять талкер
    return SafeArea(
      child: Stack(
        children: [
          AutoTabsScaffold(
            backgroundColor: AppColors.primaryMainBackground,
            routes: const [
              MainRouteWidgetRoute(),
              AuthInTabBarWidgetRoute(),
            ],
            bottomNavigationBuilder: (_, tabsRouter) {
              return CupertinoTabBar(
                backgroundColor: AppColors.primaryBackgroundSearch,
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppImages.window_tab_icon,
                    ),
                    activeIcon:SvgPicture.asset(
                      AppImages.window_active,
                    ) ,
                    label: 'Мои проекты'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AppImages.person_tab_icon),
                    activeIcon:SvgPicture.asset(
                      AppImages.person_active,
                    ) ,
                    label: 'Мой аккаунт'.tr,
                  ),
                ],
              );
            },
          ),
          //todo убрать когда буду удалять талкер
          Positioned(
            top: 0.0,
            right: 100.0,
            child: CupertinoButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => MaterialApp(
                        home: TalkerScreen(
                      talker: talker,
                      appBarTitle: '',
                      appBarLeading: null,
                    )),
                  ),
                );
              },
              child: const Icon(Icons.info),
            ),
          ),
        ],
      ),
    );
  }
}
