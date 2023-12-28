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
                  width: double.infinity,
                  //todo заменить на настоящую иконку
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7.0,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 24,
                        ),
                        Icon(
                          Icons.history,
                          color: AppColors.primaryButtons,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          'Синхронизация вашего аккаунта...'.tr,
                          style: AppTextStyles.foontoneBold,
                        ),
                      ],
                    ),
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
                                style: AppTextStyles.callout,
                              ),
                              trailing: const RightArrowWidget(),
                              onTap: () {
                                Navigator.of(context).pushNamed('profile');
                              },
                              padding: AppDimensions.tilePadding,
                            ),
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 4,
                        ),
                        child: Text(
                          'Изменяйте ваш профиль, email, пароль'.tr,
                          style: AppTextStyles.caption1,
                        ),
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
                                    padding: AppDimensions.edgeInsetsButtons,
                                    child: Text(
                                      'ВЛАДЕЛЕЦ'.tr,
                                      style: AppTextStyles.caption2bold
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
                              'Профиль Kомпании'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: Row(
                              children: [
                                Text(
                                  'Настоить'.tr,
                                  style: AppTextStyles.callout.copyWith(
                                    color: AppColors.primaryBackgroundSearch,
                                  ),
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
                            // leadingSize: 100,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Создавайте неограниченные'.tr,
                                      style: AppTextStyles.foontoneBold,
                                    ),
                                    Text(
                                      'проекты,работайте в командах!'.tr,
                                      style: AppTextStyles.foontoneBold,
                                    ),
                                    Text(
                                      '3 тарифа, начиная от 300₽/месяц'.tr,
                                      style: AppTextStyles.foontoneBold,
                                    ),
                                  ],
                                ),
                                CupertinoButton(
                                  onPressed: () {},
                                  color: AppColors.accentsPrimary,
                                  padding: AppDimensions.edgeInsetsButtons,
                                  minSize: 1,
                                  child: Text(
                                    'ВЫБРАТЬ'.tr,
                                    style: AppTextStyles.caption2bold.copyWith(
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
                      //todo нужно подумать над общим отступом
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          bottom: 16,
                          top: 4,
                        ),
                        child: Text(
                          'Изменяйте ваш профиль, email, пароль'.tr,
                          style: AppTextStyles.caption1,
                        ),
                      ),
                      CupertinoListSection.insetGrouped(
                        // separatorColor: Colors.transparent,
                        margin: const EdgeInsets.all(0),
                        children: [
                          CupertinoListTile(
                            title: Text(
                              'Помощь & Поддержка'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: const Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                RightArrowWidget(),
                              ],
                            ),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            title: Text(
                              'Сообщить об ошибке'.tr,
                              style: AppTextStyles.callout
                                  .copyWith(color: AppColors.accentsPrimary),
                            ),
                            trailing: const Icon(CupertinoIcons.link),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            title: Text(
                              'Предложить улучшение'.tr,
                              style: AppTextStyles.callout
                                  .copyWith(color: AppColors.accentsPrimary),
                            ),
                            trailing: const Icon(CupertinoIcons.link),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      CupertinoListSection.insetGrouped(
                        // separatorColor: Colors.transparent,
                        margin: const EdgeInsets.all(0),
                        children: [
                          CupertinoListTile(
                            title: Text(
                              'Пользовательские настройки'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: const Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                RightArrowWidget(),
                              ],
                            ),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            title: Text(
                              'Безопасность'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: const RightArrowWidget(),
                            onTap: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: CupertinoButton(
                              onPressed: () {},
                              color: AppColors.accentsBackground,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13.0)),
                              minSize: 1,
                              child: SizedBox(
                                height: 50,
                                // width: 67,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Оценить'.tr,
                                      style: AppTextStyles.bodyBold.copyWith(
                                        color: AppColors.accentsPrimary,
                                      ),
                                    ),
                                    // const SizedBox(width: 20.0,),
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      color: AppColors.accentsPrimary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: CupertinoButton(
                              onPressed: () {},
                              color: AppColors.accentsBackground,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13.0)),
                              minSize: 1,
                              child: SizedBox(
                                height: 50,
                                // width: 67,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Поделиться'.tr,
                                      style: AppTextStyles.bodyBold.copyWith(
                                        color: AppColors.accentsPrimary,
                                      ),
                                    ),
                                    // const SizedBox(width: 20.0,),
                                    Icon(
                                      Icons.reply,
                                      size: 36,
                                      textDirection: TextDirection.rtl,
                                      color: AppColors.accentsPrimary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),

                      CupertinoListSection.insetGrouped(
                        // separatorColor: Colors.transparent,
                        margin: const EdgeInsets.all(0),
                        children: [
                          CupertinoListTile(
                            title: Row(
                              children: [
                                CupertinoButton(
                                  onPressed: () {},
                                  minSize: 1,
                                  padding: const EdgeInsets.all(4),
                                  color: Colors.red.shade50,
                                  child: Icon(
                                    Icons.logout,
                                    size: 20,
                                    textDirection: TextDirection.rtl,
                                    color: AppColors.modalsSOS,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Выйти'.tr,
                                      style: AppTextStyles.bodyBold
                                          .copyWith(color: AppColors.modalsSOS),
                                    ),
                                    Text(
                                      'apollonovasofia@gmail.com'.tr,
                                      style: AppTextStyles.foontoneBold,
                                    ),
                                  ],
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
