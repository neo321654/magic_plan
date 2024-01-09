import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/my_custom_nav_bar.dart';
import '/resources/resources.dart';
import '/main.dart';

@RoutePage()
class DeleteProfilePage extends StatefulWidget {
  const DeleteProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  DeleteProfilePageState createState() => DeleteProfilePageState();
}

class DeleteProfilePageState extends State<DeleteProfilePage> {
  late User user;

  @override
  void initState() {
    if (auth.currentUser != null) {
      user = auth.currentUser!;
    }

    auth.userChanges().listen((event) {
      if (event != null && mounted) {
        setState(() {
          user = event;
        });
      }
    });

    talker.debug(user.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: AppColors.primaryMainBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: MyNavBar(
                title: widget.title,
                prevTitle: 'Аккаунт'.tr,
              ),
              pinned: true,
              floating: false,
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Вы должны знать...'.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.proDisplay,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 13.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.modalsBackgroundSOS,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            13.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lens,color: AppColors.modalsSOS,size: 6,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Все ваши данные будут сразу же удалены'.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.foontoneText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.lens,color: AppColors.modalsSOS,size: 6,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Все ваши данные будут сразу же удалены'.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.foontoneText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.lens,color: AppColors.modalsSOS,size: 6,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Все ваши данные будут сразу же удалены'.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.foontoneText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.lens,color: AppColors.modalsSOS,size: 6,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Все ваши данные будут сразу же удалены'.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.foontoneText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.lens,color: AppColors.modalsSOS,size: 6,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Все ваши данные будут сразу же удалены'.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.foontoneText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.lens,color: AppColors.modalsSOS,size: 6,),
                              SizedBox(width: 10.0,),
                              Text(
                                'Все ваши данные будут сразу же удалены'.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.foontoneText,
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
        ));
  }
}
