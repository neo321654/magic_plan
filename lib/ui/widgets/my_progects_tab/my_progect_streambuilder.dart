import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '/ui/widgets/my_progects_tab/widgets/my_progects_not_auth_screen.dart';
import '/ui/widgets/my_progects_tab/widgets/my_progects_auth_screen.dart';
import '../../../main.dart';

@RoutePage()
class MyProgectsStreamWidgetPage extends StatelessWidget {
  const MyProgectsStreamWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MyProgectsAuthWidgetPage();
        }
         return const MyProgectsNotAuthWidgetPage();
      },
    );
  }


}
