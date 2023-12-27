import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/ui/widgets/greeting/widgets/greeting_auth.dart';
import '../../../main.dart';
import '/resources/resources.dart';
import '/domain/services/auth_service.dart';
import '/domain/services/user_service.dart';
import '/ui/navigation/main_navigation.dart';
import 'package:provider/provider.dart';
import '../components/widgets.dart';

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
    //final viewModel = context.read<_ViewModel>();
    return CupertinoPageScaffold(
      backgroundColor: AppColors.primaryMainBackground,


     child: StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GreetingAuth(signOut:_signOut);

          }
          return CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: MyNavBar(),
                pinned: true,
                floating: false,
              ),
              SliverSafeArea(
                top: false,
                minimum: const EdgeInsets.only(top: 4),
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                      horizontal: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Приветствуем,".tr,
                            style: AppTextStyles.subheadline,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 6,
                            left: 16.0,
                            right: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Рады вас видеть!".tr,
                                style: AppTextStyles.t3Bold,
                              ),
                              SvgPicture.asset('assets/svg/person.svg'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14,),
                        CupertinoListSection.insetGrouped(
                          separatorColor: Colors.transparent,
                          margin: const EdgeInsets.all(0),
                          children: [
                            CupertinoListTile(
                              title: Text(
                                'Войти в аккаунт'.tr,
                                style: AppTextStyles.calloutBlue,
                              ),
                              trailing: const RightArrowWidget(),
                              onTap: () {
                                //todo изменить на вход в аккаунт
                                Navigator.of(context).pushNamedAndRemoveUntil('auth', (route) => false);
                              },
                              padding: AppDimensions.tilePadding,
                            ),
                            Divider(
                              height: 2,
                              color: AppColors.primaryButtons,
                            ),
                            CupertinoListTile(
                              title: Text('Зарегистрироваться'.tr,style:AppTextStyles.callout,),
                              trailing: const RightArrowWidget(),
                              onTap: () {
                                Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                              },
                              padding: AppDimensions.tilePadding,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1000,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),



    );
  }

  Future<void> _signOut() async {
    await auth.signOut();
  }
}





class MyNavBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CupertinoNavigationBar(
      border: Border.all(color: AppColors.primaryIcons),
      backgroundColor: AppColors.primaryMainBackground,
      middle: Text(
        "Мой аккаунт".tr,
        style: AppTextStyles.bodyBold,
      ),
    );
  }

  @override
  double get maxExtent => 68.0;

  @override
  double get minExtent => 68.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
