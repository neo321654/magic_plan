import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';

import '/domain/services/auth_service.dart';
import 'package:provider/provider.dart';

class _ViewModel {
  final _authService = AuthService();
  BuildContext context;

  _ViewModel(this.context);

  void checkAuth() async {
    final isAuth = await _authService.checkAuth();
    if (isAuth) {
      _goToMainScreenAuth();
    } else {
      _goToMainScreenNoAuth();
    }
  }

  void _goToMainScreenNoAuth() {
    Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
  }

  //todo здесь подменить на другой скрин, когда мы зарегины
  void _goToMainScreenAuth() {
    Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
  }
}

@RoutePage()
class LoaderWidgetPage extends StatelessWidget {
  const LoaderWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF171717),
      child:  Center(
        child: CupertinoButton(
          onPressed: () {
            context.read<_ViewModel>().checkAuth();
          },
          child: const Text('enter'),
        ),
      ),

    );
  }

  static Widget create() {
    return Provider(
      create: (context) => _ViewModel(context),
      lazy: false,
      child: const LoaderWidgetPage(),
    );
  }
}
