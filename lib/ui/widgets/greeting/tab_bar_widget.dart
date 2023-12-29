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
    return CupertinoPageScaffold(
      child: StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GreetingAuthPage();
          }
          return const GreetingNotAuthPage();
        },
      ),
    );
  }

  Future<void> _signOut() async {
    await auth.signOut();
  }
}
