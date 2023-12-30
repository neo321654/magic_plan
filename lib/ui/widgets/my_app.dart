import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../main.dart';
import '../../navigation/app_router.dart';
import '/resources/resources.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key}) : appRouter = AppRouter();

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // return CupertinoApp.router(
    //
    //   routerConfig: appRouter.config(),
    //   title: 'Magic plan'.tr,
    //   theme:  CupertinoThemeData(brightness: Brightness.light,primaryColor: AppColors.accentsPrimary),
    //
    // );

    return CupertinoApp.router(
      title: 'Magic plan'.tr,
      theme:  CupertinoThemeData(brightness: Brightness.light,primaryColor: AppColors.accentsPrimary),
      // routerConfig: appRouter.config(),
      routeInformationParser: appRouter.defaultRouteParser(),
      routeInformationProvider: appRouter.routeInfoProvider(),
      routerDelegate: AutoRouterDelegate(
        appRouter,
        navigatorObservers: () => [
          TalkerRouteObserver(talker),
        ],
      ),
    );
  }
}
