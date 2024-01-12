import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
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

              ],
            ),
          ),
        ),
      ),
    );
  }





}

