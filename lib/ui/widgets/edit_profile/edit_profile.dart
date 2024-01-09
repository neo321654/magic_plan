import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../components/my_custom_nav_bar.dart';
import '../components/widgets.dart';
import '/resources/resources.dart';
import '../auth/auth.dart';
import '/main.dart';
import 'package:flutter/material.dart';


@RoutePage()
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  late User user;
  late TextEditingController controller;
  final phoneController = TextEditingController();

  String? photoURL;

  bool showSaveButton = false;
  bool isLoading = false;

  @override
  void initState() {
    if (auth.currentUser != null) {
      user = auth.currentUser!;
      controller = TextEditingController(text: user.displayName);
    }

    controller.addListener(_onNameChanged);

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
  void dispose() {
    controller.removeListener(_onNameChanged);

    super.dispose();
  }

  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _onNameChanged() {
    setState(() {
      if (controller.text == user.displayName || controller.text.isEmpty) {
        showSaveButton = false;
      } else {
        showSaveButton = true;
      }
    });
  }

  List get userProviders => user.providerData.map((e) => e.providerId).toList();

  Future updateDisplayName() async {
    await user.updateDisplayName(controller.text);

    setState(() {
      showSaveButton = false;
    });

    // ignore: use_build_context_synchronously
    ScaffoldSnackbar.of(context).show('Name updated');
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
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [



                      CupertinoListSection.insetGrouped(

                          // separatorColor: Colors.transparent,
                          margin: const EdgeInsets.all(0),
                          children: [
                            CupertinoListTile(
                              title: Text(
                                'Имя'.tr,
                                style: AppTextStyles.callout,
                              ),
                              additionalInfo: Text(
                                'Настроить'.tr,
                                style: AppTextStyles.callout
                                    .copyWith(color: AppColors.primaryButtons),
                              ),
                              trailing: const RightArrowWidget(),
                              onTap: () {
                                // context.router.push(ProfileRoute());
                              },
                              padding: AppDimensions.tilePadding,
                            ),
                            CupertinoListTile(
                              title: Text(
                                'Фамилия'.tr,
                                style: AppTextStyles.callout,
                              ),
                              additionalInfo: Text(
                                  'Настроить'.tr,
                                style: AppTextStyles.callout
                                    .copyWith(color: AppColors.primaryButtons),
                              ),
                              trailing: const RightArrowWidget(),
                              onTap: () {
                                // context.router.push(ProfileRoute());
                              },
                              padding: AppDimensions.tilePadding,
                            ),
                            CupertinoListTile(
                              title: Text(
                                'Телефон'.tr,
                                style: AppTextStyles.callout,
                              ),
                              additionalInfo: Text(

                                user.phoneNumber??'+7(111)1111111',
                                style: AppTextStyles.callout
                                    .copyWith(color: AppColors.primaryButtons),
                              ),
                              trailing: const RightArrowWidget(),
                              onTap: () {
                                // context.router.push(ProfileRoute());
                              },
                              padding: AppDimensions.tilePadding,
                            ),
                          ]),

                      const SizedBox(
                        height: 16.0,
                      ),
                      CupertinoListSection.insetGrouped(
                        // separatorColor: Colors.transparent,
                        margin: const EdgeInsets.all(0),
                        children: [
                          CupertinoListTile(
                            title: Text(
                              'Изменить Email'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: const RightArrowWidget(),
                            onTap: () {
                              // context.router.push(ProfileRoute());
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                          CupertinoListTile(
                            title: Text(
                              'Обновить пароль'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: const RightArrowWidget(),
                            onTap: () {
                              // context.router.push(ProfileRoute());
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CupertinoListSection.insetGrouped(
                        // separatorColor: Colors.transparent,
                        margin: const EdgeInsets.all(0),
                        children: [
                          CupertinoListTile(
                            title: Text(
                              'Информация об Обновлениях'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing: CupertinoSwitch(
                              // This bool value toggles the switch.
                              value: true,
                              activeColor: AppColors.accentsPrimary,
                              onChanged: (bool? value) {
                                // This is called when the user toggles the switch.
                                // setState(() {
                                //   switchValue = value ?? false;
                                // });
                              },
                            ),
                            onTap: () {
                              // context.router.push(ProfileRoute());
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'Сейчас вы получаете информацию об обновлениях платформы на ваш email.'
                                    .tr,
                            style: AppTextStyles.caption1,
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Условия политики конф.'.tr,
                                style: AppTextStyles.caption1.copyWith(
                                  color: AppColors.accentsPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CupertinoListSection.insetGrouped(
                        // separatorColor: Colors.transparent,
                        margin: const EdgeInsets.all(0),
                        children: [
                          CupertinoListTile(
                            title: Text(
                              'Удалить Аккаунт'.tr,
                              style: AppTextStyles.callout,
                            ),
                            trailing:
                            const RightArrowWidget(),
                            onTap: () {
                              // context.router.push(ProfileRoute());
                            },
                            padding: AppDimensions.tilePadding,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Future<String?> getPhotoURLFromUser() async {
    String? photoURL;

    // Update the UI - wait for the user to enter the SMS code
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('New image Url:'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
            OutlinedButton(
              onPressed: () {
                photoURL = null;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
          content: Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                photoURL = value;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
          ),
        );
      },
    );

    return photoURL;
  }

  Future<void> _signOut() async {
    await auth.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);
  }
}
