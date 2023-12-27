import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/my_custom_nav_bar.dart';
import '/resources/resources.dart';

import '../../components/widgets.dart';

class GreetingAuth extends StatelessWidget {
  const GreetingAuth({required this.signOut, Key? key}) : super(key: key);

  final Future<void> Function() signOut;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: MyNavBar(title: 'Мой аккаунт'.tr),
          pinned: true,
          floating: false,
        ),
        SliverSafeArea(
          top: false,
          // minimum: const EdgeInsets.only(top: 4),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  color: AppColors.primaryBackgroundSearch,
                  height: 24,
                  width: double.infinity,
                  //todo заменить на настоящую иконку
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 24,
                      ),
                      Icon(
                        CupertinoIcons.arrow_up_arrow_down_circle_fill,
                        color: AppColors.primaryIcons,
                      ),
                      //todo создать нужный стиль для текста и цвета проверить на всём экране
                      Text(
                        'Синхронизация вашего аккаунта...'.tr,
                        style: AppTextStyles.callout,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.0,
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
                              "apollonovasophia@gmail.com".tr,
                              style: AppTextStyles.t3Bold,
                            ),
                            SvgPicture.asset('assets/svg/person.svg'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CupertinoListSection.insetGrouped(
                          separatorColor: Colors.transparent,
                          margin: const EdgeInsets.all(0),
                          children: [
                            CupertinoListTile(
                              title: Text(
                                'Аккаунт'.tr,
                                style: AppTextStyles.calloutBlue,
                              ),
                              trailing: const RightArrowWidget(),
                              onTap: () {
                                //todo изменить на вход в аккаунт
                                Navigator.of(context).pushNamed('profile');
                              },
                              padding: AppDimensions.tilePadding,
                            ),
                          ]),
                      Text(
                        'Изменяйте ваш профиль, email, пароль'.tr,
                        style: AppTextStyles.callout,
                      ),
                      CupertinoListSection.insetGrouped(
                        // separatorColor: Colors.transparent,
                        margin: const EdgeInsets.all(0),
                        children: [
                          CupertinoListTile(
                            title: Row(
                              children: [
                                Text(
                                  'Apollonovasofia'.tr,
                                  style: AppTextStyles.callout,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryButtons,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'ВЛАДЕЛЕЦ'.tr,
                                      style: AppTextStyles.callout
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: AppColors.primaryBackgroundSearch,
                            trailing: const RightArrowWidget(),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            title: Text(
                              'Профиль компании'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: Row(
                              children: [
                                Text(
                                  'Настоить'.tr,
                                  style: AppTextStyles.callout,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const RightArrowWidget(),
                              ],
                            ),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            title: Text(
                              'Подписка'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: const RightArrowWidget(),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            leadingSize: 100,
                            title:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Создавайте неограниченные'.tr,
                                      style: AppTextStyles.callout,
                                    ),
                                    Text(
                                      'проекты,работайте в командах!'.tr,
                                      style: AppTextStyles.callout,
                                    ),
                                    Text(
                                      '3 тарифа, начиная от 300₽/месяц'.tr,
                                      style: AppTextStyles.callout,
                                    ),
                                  ],
                                ),
                                CupertinoButton.filled(
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  child:
                                  Text(
                                    'ВЫБРАТЬ'.tr,
                                    style: AppTextStyles.callout.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),


                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),

                        ],
                      ),
                      const SizedBox(height: 10,),
                      //todo нужно подумать над общим отступом
                      Text(
                        'Изменяйте ваш профиль, email, пароль'.tr,
                        style: AppTextStyles.callout,
                      ),
                      CupertinoListSection.insetGrouped(
                        // separatorColor: Colors.transparent,
                        margin: const EdgeInsets.all(0),
                        children: [
                          CupertinoListTile(
                            title: Row(
                              children: [
                                Text(
                                  'Apollonovasofia'.tr,
                                  style: AppTextStyles.callout,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryButtons,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'ВЛАДЕЛЕЦ'.tr,
                                      style: AppTextStyles.callout
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: AppColors.primaryBackgroundSearch,
                            trailing: const RightArrowWidget(),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            title: Text(
                              'Профиль компании'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: Row(
                              children: [
                                Text(
                                  'Настоить'.tr,
                                  style: AppTextStyles.callout,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const RightArrowWidget(),
                              ],
                            ),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            title: Text(
                              'Подписка'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: const RightArrowWidget(),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            leadingSize: 100,
                            title:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Создавайте неограниченные'.tr,
                                      style: AppTextStyles.callout,
                                    ),
                                    Text(
                                      'проекты,работайте в командах!'.tr,
                                      style: AppTextStyles.callout,
                                    ),
                                    Text(
                                      '3 тарифа, начиная от 300₽/месяц'.tr,
                                      style: AppTextStyles.callout,
                                    ),
                                  ],
                                ),
                                CupertinoButton.filled(
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  child:
                                  Text(
                                    'ВЫБРАТЬ'.tr,
                                    style: AppTextStyles.callout.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),


                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),

                        ],
                      ),



                      TextButton(
                        onPressed: signOut,
                        child: Text('Выйти'.tr),
                      ),
                      const SizedBox(
                        height: 1000,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
