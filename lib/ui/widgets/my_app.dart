import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../navigation/app_router.dart';
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
      theme:  CupertinoThemeData(brightness: Brightness.light,primaryColor: AppColors.accentsPrimary),

    );
  }
}
