import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../navigation/app_router.dart';
import '/resources/resources.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key}) : appRouter = AppRouter();

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return CupertinoApp.router(
      routerConfig: appRouter.config(),


      title: 'Magic plan'.tr,
      // onGenerateRoute: (RouteSettings settings) {
      //   if (settings.name == 'auth') {
      //     return PageRouteBuilder<dynamic>(
      //       pageBuilder: (context, animation1, animation2) =>
      //           const AuthGatePage(),
      //       transitionDuration: Duration.zero,
      //     );
      //   } else if (settings.name == '/') {
      //     return PageRouteBuilder<dynamic>(
      //       pageBuilder: (context, animation1, animation2) =>
      //           GreetingPage.create(),
      //       transitionDuration: Duration.zero,
      //     );
      //   }
      //   else if (settings.name == 'loader') {
      //     return PageRouteBuilder<dynamic>(
      //       pageBuilder: (context, animation1, animation2) =>
      //           LoaderWidgetPage.create(),
      //       transitionDuration: Duration.zero,
      //     );
      //   }
      //   else if (settings.name == 'profile') {
      //     return PageRouteBuilder<dynamic>(
      //       pageBuilder: (context, animation1, animation2) =>
      //       const ProfilePage(),
      //       transitionDuration: Duration.zero,
      //     );
      //   }
      //   return null;
      // },
      theme:  CupertinoThemeData(brightness: Brightness.light,primaryColor: AppColors.accentsPrimary),
      // home: LoaderWidgetPage.create(),
      // home: const GreetingScreen(),
    );
  }
}
