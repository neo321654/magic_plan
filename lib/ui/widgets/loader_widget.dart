import '/domain/services/auth_service.dart';
import 'package:flutter/material.dart';
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
    Navigator.of(context).pushNamedAndRemoveUntil('example', (route) => false);
  }

  //todo здесь подменить на другой скрин, когда мы зарегины
  void _goToMainScreenAuth() {
    Navigator.of(context).pushNamedAndRemoveUntil('example', (route) => false);
  }
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171717),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Цвет фона
          ),
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
      child: const LoaderWidget(),
    );
  }
}
