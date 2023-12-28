import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:magic_plan/ui/widgets/profile/profile.dart';
import '/resources/resources.dart';
import 'greeting/greeting_widget.dart';
import '/ui/widgets/loader_widget.dart';
import 'auth/auth.dart';

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
        }
        else if (settings.name == 'loader') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                LoaderWidget.create(),
            transitionDuration: Duration.zero,
          );
        }
        else if (settings.name == 'profile') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
            const ProfilePage(),
            transitionDuration: Duration.zero,
          );
        }
        return null;
      },
      theme: const CupertinoThemeData(brightness: Brightness.light),
      // home: LoaderWidget.create(),
      home: const GreetingScreen(),
    );
  }
}
