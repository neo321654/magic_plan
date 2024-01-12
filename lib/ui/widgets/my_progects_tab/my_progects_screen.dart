import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magic_plan/resources/resources.dart';

import '../../../main.dart';
import '../components/functions.dart';

@RoutePage()
class MainScreenWidgetPage extends StatefulWidget {
  const MainScreenWidgetPage({Key? key}) : super(key: key);

  @override
  State<MainScreenWidgetPage> createState() => _MainScreenWidgetPageState();
}

class _MainScreenWidgetPageState extends State<MainScreenWidgetPage> {
  String name = '';
  String surname = '';

  @override
  void initState() {
    updateNameSurname();
    auth.userChanges().listen((event) {
      setState(() {
        updateNameSurname();
      });
    });
    super.initState();
  }

  void updateNameSurname() {
    List<String> nameSurList =
        getNameSurnameSplit(auth.currentUser?.displayName);
    name = nameSurList[0];
    surname = nameSurList[1];
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
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
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
                      '$name $surname',
                      style: AppTextStyles.t3Bold,
                    ),
                    const Icon(Icons.expand_less_outlined),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0,),
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
                Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: 158.0,                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppImages.current_progect),
                            fit: BoxFit.fill),
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
        ],
      ),
    );
  }
}
