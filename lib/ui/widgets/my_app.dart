import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '/resources/resources.dart';
import '/ui/widgets/auth_widget.dart';
import '/ui/widgets/greeting_widget.dart';
import '/ui/widgets/loader_widget.dart';
import 'auth.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return CupertinoApp(
      title: 'Magic plan'.tr,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'auth') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                const AuthGate(),
            transitionDuration: Duration.zero,
          );
        } else if (settings.name == 'greeting') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                GreetingScreen.create(),
            transitionDuration: Duration.zero,
          );
        } else if (settings.name == 'loader') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                LoaderWidget.create(),
            transitionDuration: Duration.zero,
          );
        }
        return null;
      },
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: LoaderWidget.create(),
      //  home: AuthWidget.create(),
    );
  }
}
