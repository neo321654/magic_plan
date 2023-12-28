import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '../navigation/app_router.dart';

@RoutePage()
class LoaderWidgetPage extends StatelessWidget {
  const LoaderWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CupertinoPageScaffold(
          backgroundColor: const Color(0xFF171717),
          child:  Center(
            child: CupertinoButton(
              onPressed: () {
                // context.read<_ViewModel>().checkAuth();
                // context.router.pushNamed('auth');
                context.router.replace(const GreetingWidgetRoute());
                // context.router.navigateNamed('/greeting');
                // AutoRouter.of(context).push(GreetingWidgetRoute());

              },
              child: const Text('enter'),
            ),
          ),

        );
      }
    );
  }


}
