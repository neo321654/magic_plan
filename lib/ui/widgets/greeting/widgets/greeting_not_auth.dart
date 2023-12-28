import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../navigation/app_router.dart';
import '../../components/my_custom_nav_bar.dart';
import '/resources/resources.dart';

import '../../components/widgets.dart';

@RoutePage()
class GreetingNotAuthPage extends StatelessWidget {
  const GreetingNotAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: MyNavBar(title:'Мой аккаунт'.tr),
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
                      "ПриветствуемAuth,".tr,
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
                          // context.router.push(AuthGateRoute());
                          // router.root
                          // context.router.root.replace(const AuthGateRoute());
                          // context.router.root.push(const AuthGateRoute());
                          context.router.navigateNamed('/root/auth');
                        // context.router.push(AuthGateRoute());
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
                          // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
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
  }
}