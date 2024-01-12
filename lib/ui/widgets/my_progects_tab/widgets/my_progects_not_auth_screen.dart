import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magic_plan/resources/resources.dart';

@RoutePage()
class MyProgectsNotAuthWidgetPage extends StatefulWidget {
  const MyProgectsNotAuthWidgetPage({Key? key}) : super(key: key);

  @override
  State<MyProgectsNotAuthWidgetPage> createState() =>
      _MyProgectsNotAuthWidgetPageState();
}

class _MyProgectsNotAuthWidgetPageState
    extends State<MyProgectsNotAuthWidgetPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(34),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppImages.tune_icon),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(34),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppImages.plus),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CupertinoSearchTextField(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 8.0,
              ),
              itemSize: 26,
              suffixMode: OverlayVisibilityMode.always,
              placeholder: 'Поиск проектов'.tr,
              suffixIcon: const Icon(
                Icons.mic,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: GridView.count(
              childAspectRatio: 0.4,
              crossAxisSpacing: 9,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: 158.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.demo_prog_img),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Демо проект'.tr,
                      style: AppTextStyles.foontoneBoldBold,
                    ),
                    Text(
                      'Нажмите, чтобы изучить'.tr,
                      style: AppTextStyles.proText12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: CupertinoButton(
                          minSize: 0,
                          padding: const EdgeInsets.symmetric(
                            vertical: 13.0,
                            horizontal: 12.0,
                          ),
                          color: AppColors.accentsBackground,
                          child: Text(
                            'Войти'.tr,
                            style: AppTextStyles.bodyBold
                                .copyWith(color: AppColors.accentsPrimary),
                          ),
                          onPressed: () {
                            context.router.navigateNamed('/root/auth');
                          }),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: CupertinoButton(
                          minSize: 0,
                          padding: const EdgeInsets.symmetric(
                            vertical: 13.0,
                            horizontal: 12.0,
                          ),
                          color: AppColors.accentsBackground,
                          child: Text(
                            'Создать аккаунт'.tr,
                            style: AppTextStyles.bodyBold
                                .copyWith(color: AppColors.accentsPrimary),
                          ),
                          onPressed: () {
                            context.router.navigateNamed('/root/auth');

                          }),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
