import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '/ui/widgets/greeting/widgets/greeting_auth.dart';
import '../../../main.dart';
import 'widgets/greeting_not_auth.dart';

@RoutePage()
class AuthInTabBarWidgetPage extends StatelessWidget {
  const AuthInTabBarWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const GreetingAuthPage();
        }
         return const GreetingNotAuthPage();
      },
    );
  }


}
