import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/domain/services/auth_service.dart';
import '/domain/services/user_service.dart';
import '/ui/navigation/main_navigation.dart';
import 'package:provider/provider.dart';

class _ViewModelState {
  final String ageTitle;

  _ViewModelState({
    required this.ageTitle,
  });
}

class _ViewModel extends ChangeNotifier {
  final _authService = AuthService();
  final _userService = UserService();

  var _state = _ViewModelState(ageTitle: '');

  _ViewModelState get state => _state;

  void loadValue() async {
    await _userService.initilalize();
    _updateState();
  }

  _ViewModel() {
    loadValue();
  }

  Future<void> onIncrementButtonPressed() async {
    _userService.incrementAge();
    _updateState();
  }

  Future<void> onDecrementButtonPressed() async {
    _userService.decrementAge();
    _updateState();
  }

  Future<void> onLogoutPressed(BuildContext context) async {
    await _authService.logout();
    MainNavigation.showLoader(context);
  }

  void _updateState() {
    final user = _userService.user;

    _state = _ViewModelState(
      ageTitle: user.age.toString(),
    );
    notifyListeners();
  }
}

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => _ViewModel(),
      child: const GreetingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: MyNav(),
            pinned: true,
            floating: false,
          ),
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: 4),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  SizedBox(height: 1000,),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                  Text('dfdfdf'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyNav extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return const CupertinoNavigationBar(
      middle: Text(
          "Мой аккаунт",
          style: TextStyle(
            fontSize: 17,
            //fontWeight: FontWeight.w600,
          )
      )
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
