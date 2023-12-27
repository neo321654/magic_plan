import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/resources/resources.dart';

import '../../components/widgets.dart';
import '../../greeting_widget.dart';

class GreetingAuth extends StatelessWidget {
  const GreetingAuth({required  this.signOut, Key? key}) : super(key: key);

  final Future<void> Function() signOut;
  @override
  Widget build(BuildContext context) {
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
                  TextButton(
                    onPressed: signOut,
                    child: const Text('Sign out'),
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