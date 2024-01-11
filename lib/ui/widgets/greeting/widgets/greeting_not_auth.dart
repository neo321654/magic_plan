import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../navigation/app_router.dart';
import '../../components/device_information.dart';
import '../../components/my_custom_nav_bar.dart';
import '/resources/resources.dart';

import '../../components/widgets.dart';

@RoutePage()
class GreetingNotAuthPage extends StatefulWidget {
  const GreetingNotAuthPage({Key? key}) : super(key: key);

  @override
  State<GreetingNotAuthPage> createState() => _GreetingNotAuthPageState();
}

class _GreetingNotAuthPageState extends State<GreetingNotAuthPage> {
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  String _appVersion = '';


  @override
  void initState() {
    super.initState();
    DevInf devInf = DevInf();
    devInf.initPlatformState().then((value) {
      if (!mounted) return;

      setState(() {
        _deviceData = value;
        _appVersion = devInf.packageInfo.version;
      });
      return null;
    });
  }

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
                        SvgPicture.asset(AppImages.person),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CupertinoListSection.insetGrouped(
                    backgroundColor: AppColors.primaryMainBackground,
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
                          context.router.push(const AuthGateRoute());
                        },
                        padding: AppDimensions.tilePadding,
                      ),
                      Divider(
                        height: 2,
                        color: AppColors.primaryButtons,
                      ),
                      CupertinoListTile(
                        title: Text(
                          'Зарегистрироваться'.tr,
                          style: AppTextStyles.callout,
                        ),
                        trailing: const RightArrowWidget(),
                        onTap: () {
                          // auth.signInWithEmailAndPassword(email: 'neo321654@rambler.ru', password: '111111');
                        },
                        padding: AppDimensions.tilePadding,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CupertinoListSection.insetGrouped(
                    backgroundColor: AppColors.primaryMainBackground,
                    separatorColor: Colors.transparent,
                    margin: const EdgeInsets.all(0),
                    children: [
                      CupertinoListTile(
                        title: Text(
                          'Помощь & Поддержка'.tr,
                          style: AppTextStyles.callout,
                        ),
                        trailing: const RightArrowWidget(),
                        onTap: () {
                          context.router.push(const AuthGateRoute());
                        },
                        padding: AppDimensions.tilePadding,
                      ),
                      Divider(
                        height: 2,
                        color: AppColors.primaryButtons,
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
                      Divider(
                        height: 2,
                        color: AppColors.primaryButtons,
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
                    height: 16.0,
                  ),
                  CupertinoListSection.insetGrouped(
                    separatorColor: Colors.transparent,
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
                      Divider(
                        height: 2,
                        color: AppColors.primaryButtons,
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
                    height: 40,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ],
              ),
            ),
          ),
        ),

        //'name': if 14 pro,
        //identifierForVendor
        //systemVersion

        //device
        //id
        //version.sdkInt

        SliverList(
          delegate: SliverChildListDelegate(
            (_deviceData.keys.contains('name'))
                ? [
                    Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Модель: ${_deviceData['name']}',
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                              'ID устройства: ${_deviceData['identifierForVendor']}'),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text('Версия IOS: ${_deviceData['systemVersion']}'),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                              'Версия приложения: $_appVersion'),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ]
                : [
                    Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Модель: ${_deviceData['device']}',
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text('ID устройства: ${_deviceData['id']}'),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text('Версия SDK: ${_deviceData['version.sdkInt']}'),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                              'Версия приложения: $_appVersion'),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ],

            // _deviceData.keys.map(
            //
            //       (String property) {
            //     return Row(
            //       children: <Widget>[
            //         Container(
            //           padding: const EdgeInsets.all(10),
            //           child: Text(
            //             property,
            //             style: const TextStyle(
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //         Expanded(
            //           child: Container(
            //             padding: const EdgeInsets.symmetric(vertical: 10),
            //             child: Text(
            //               '${_deviceData[property]}',
            //               maxLines: 10,
            //               overflow: TextOverflow.ellipsis,
            //             ),
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ).toList(),
            // Add more items as needed
          ),
        ),
      ],
    );
  }
}
