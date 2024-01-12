import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magic_plan/resources/resources.dart';

@RoutePage()
class MainScreenWidgetPage extends StatelessWidget {
  const MainScreenWidgetPage({Key? key}) : super(key: key);

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
            height: 10.0,
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            clipBehavior: Clip.hardEdge,
            // height: isVisible ? 33.0 : 0.0,
            color: AppColors.primaryBackgroundSearch,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7.0,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 24.0,
                  ),
                  SvgPicture.asset(AppImages.update_icon),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    'Синхронизация вашего аккаунта...'.tr,
                    style: AppTextStyles.foontoneBoldPrimaryButtonsColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 24.0,
          ),
          Container(
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Проекты / Мои проекты'.tr,
                  style: AppTextStyles.subheadline,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Apollonovasofia'.tr,
                      style: AppTextStyles.t3Bold,
                    ),
                    const Icon(Icons.expand_less_outlined),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
