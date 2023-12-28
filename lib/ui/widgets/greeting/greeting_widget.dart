import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../navigation/app_router.dart';
import '/ui/widgets/greeting/widgets/greeting_not_auth.dart';
import '/ui/widgets/greeting/widgets/greeting_auth.dart';
import '../../../main.dart';
import '/resources/resources.dart';
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

@RoutePage()
class GreetingPage extends StatelessWidget {
  const GreetingPage({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => _ViewModel(),
      child: const GreetingPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final viewModel = context.read<_ViewModel>();

    return AutoTabsRouter(
      routes: const [
        GreetingNotAuthRoute(),
        LoaderWidgetRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            onTap: tabsRouter.setActiveIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.star_fill),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.clock_solid),
                label: 'Recents',
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return child;
          },
        );
        // CupertinoTabScaffold(
        //  backgroundColor: AppColors.primaryMainBackground,
        //  tabBuilder: (BuildContext context, int index) {
        //    return CupertinoTabView(
        //      builder: (BuildContext context) {
        //        return StreamBuilder<User?>(
        //          stream: auth.authStateChanges(),
        //          builder: (context, snapshot) {
        //            if (snapshot.hasData) {
        //              return GreetingAuth(signOut: _signOut);
        //            }
        //            return const GreetingNotAuth();
        //          },
        //        );
        //      },
        //    );
        //  },
      },
    );
  }

  Future<void> _signOut() async {
    await auth.signOut();
  }
}
