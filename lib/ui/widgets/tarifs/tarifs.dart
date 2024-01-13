import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magic_plan/resources/resources.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TarifsWidgetPage extends StatefulWidget {
  const TarifsWidgetPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TarifsPageState();
}

class _TarifsPageState extends State<TarifsWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: AppColors.primaryMainBackground,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 14.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
              color: AppColors.phonePlashek,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(13.0),
                topRight: Radius.circular(13.0),
              ),
            ),
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24.0,
                ),
                GestureDetector(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Закрыть".tr,
                      style: AppTextStyles.callout.copyWith(
                        color: AppColors.accentsPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Подписка".tr,
                    style: AppTextStyles.proDisplay,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CupertinoSlidingSegmentedControl(
                        backgroundColor: AppColors.primaryBackgroundSearch,
                        groupValue: 1,
                        onValueChanged: (value) {
                          if (value != null) {
                            setState(() {
                              //_selectedSegment = value;
                            });
                          }
                        },
                        children: {
                          1: Text(
                            'Ежемесячный'.tr,
                            style: AppTextStyles.foontoneBoldBold,
                          ),
                          2: Text(
                            'Годовой'.tr,
                            style: AppTextStyles.foontoneBoldBold,
                          ),
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          width: 228.0,
                          decoration: BoxDecoration(
                            color: AppColors.accentsBackground,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                13.0,
                              ),
                            ),
                          ),
                          child:
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Тариф Старт'.tr,
                                style: AppTextStyles.bodyBold,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Создавайте и делитесь профессиональными планами интерьера в 2D и 3D'
                                    .tr,
                                style: AppTextStyles.foontoneTextGray,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                'Включает'.tr,
                                style: AppTextStyles.foontoneBoldBold,
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Безлимитные проекты'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Измерение и отрисовка'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Экспорт 2D и 3D скетчей'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Общение в командах'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              CupertinoButton(
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(13.0)),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 13.0,
                                  ),
                                  minSize: 0,
                                  color: AppColors.accentsPrimary,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '429,00 руб'.tr,
                                            style: AppTextStyles.bodyBoldWhite,
                                          ),
                                          Text(
                                            'Ежемесячно'.tr,
                                            style: AppTextStyles.caption1white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0,),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          width: 228.0,
                          decoration: BoxDecoration(
                            color: AppColors.accentsBackground,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                13.0,
                              ),
                            ),
                          ),
                          child:
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Тариф Старт'.tr,
                                style: AppTextStyles.bodyBold,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Создавайте и делитесь профессиональными планами интерьера в 2D и 3D'
                                    .tr,
                                style: AppTextStyles.foontoneTextGray,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                'Включает'.tr,
                                style: AppTextStyles.foontoneBoldBold,
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Безлимитные проекты'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Измерение и отрисовка'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Экспорт 2D и 3D скетчей'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Общение в командах'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              CupertinoButton(
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(13.0)),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 13.0,
                                  ),
                                  minSize: 0,
                                  color: AppColors.accentsPrimary,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '429,00 руб'.tr,
                                            style: AppTextStyles.bodyBoldWhite,
                                          ),
                                          Text(
                                            'Ежемесячно'.tr,
                                            style: AppTextStyles.caption1white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0,),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          width: 228.0,
                          decoration: BoxDecoration(
                            color: AppColors.accentsBackground,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                13.0,
                              ),
                            ),
                          ),
                          child:
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Тариф Старт'.tr,
                                style: AppTextStyles.bodyBold,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Создавайте и делитесь профессиональными планами интерьера в 2D и 3D'
                                    .tr,
                                style: AppTextStyles.foontoneTextGray,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                'Включает'.tr,
                                style: AppTextStyles.foontoneBoldBold,
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Безлимитные проекты'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Измерение и отрисовка'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Экспорт 2D и 3D скетчей'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.check_mark),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'Общение в командах'.tr,
                                    style: AppTextStyles.caption1,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24.0,
                              ),
                              CupertinoButton(
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(13.0)),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 13.0,
                                  ),
                                  minSize: 0,
                                  color: AppColors.accentsPrimary,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '429,00 руб'.tr,
                                            style: AppTextStyles.bodyBoldWhite,
                                          ),
                                          Text(
                                            'Ежемесячно'.tr,
                                            style: AppTextStyles.caption1white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                // Flexible(child: SizedBox(height: 1,)),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Продлевается автоматически Вы можете завершить в любое время'.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption1,
                    ),

                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Условия использования'.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption1blue,
                    ),

                    const SizedBox(
                      height: 4.0,
                    ),

                    Text(
                      'Политика конфиденциальности'.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption1blue,
                    ),

                    const SizedBox(
                      height: 16.0,
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
