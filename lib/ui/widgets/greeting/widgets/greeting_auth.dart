import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magic_plan/main.dart';
import 'package:magic_plan/navigation/app_router.dart';
import 'package:magic_plan/ui/widgets/components/functions.dart';
import '../../components/my_custom_nav_bar.dart';
import '/resources/resources.dart';

import '../../components/widgets.dart';

@RoutePage()
class GreetingAuthPage extends StatefulWidget {
  const GreetingAuthPage({Key? key}) : super(key: key);

  @override
  State<GreetingAuthPage> createState() => _GreetingAuthPageState();
}

class _GreetingAuthPageState extends State<GreetingAuthPage> {
  final Future<void> Function() signOut = auth.signOut;

  String name = '';
  String surname = '';
  String email = '';
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    updateNameSurname();
    updateEmail();
    _removeWidgetAfterDelay();
  }
  void _removeWidgetAfterDelay() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isVisible = false;
      });
    });
  }

  void updateEmail() {
    email = auth.currentUser?.email ?? '';
  }

  void updateNameSurname() {
    List<String> nameSurList =
        getNameSurnameSplit(auth.currentUser?.displayName);
    name = nameSurList[0];
    surname = nameSurList[1];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: MyNavBar(title: 'Мой аккаунт'.tr),
          pinned: true,
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              AnimatedContainer(

                duration: const Duration(seconds: 1),
                clipBehavior: Clip.hardEdge,
                height: isVisible ? 33.0 : 0.0,
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
                          (email == '')
                              ? Text(
                                  "email не привязан".tr,
                                  style: AppTextStyles.t3Bold,
                                )
                              : Text(
                                  email,
                                  style: AppTextStyles.t3Bold,
                                ),
                          (auth.currentUser?.photoURL != null)
                              ? CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 23.0,
                                  backgroundImage: NetworkImage(
                                      auth.currentUser?.photoURL ?? ''),
                                )
                              : SvgPicture.asset(AppImages.person),
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
                              context.router
                                  .push(const ProfileRoute())
                                  .then((value) {
                                setState(() {
                                  updateNameSurname();
                                  updateEmail();
                                });
                              });
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
                              (name == '')
                                  ? Text(
                                      'Укажите имя'.tr,
                                      style: AppTextStyles.callout,
                                    )
                                  : Text(
                                      '$name $surname',
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
                            context.router.navigateNamed('/root/tarifs');

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
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Выйти'.tr,
                                    style: AppTextStyles.bodyBold
                                        .copyWith(color: AppColors.modalsSOS),
                                  ),
                                  (email == '')
                                      ? Text(
                                          "email не привязан".tr,
                                          style: AppTextStyles.foontoneBold,
                                        )
                                      : Text(
                                          email,
                                          style: AppTextStyles.foontoneBold,
                                        ),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            signOut();
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
      ],
    );
  }
}
