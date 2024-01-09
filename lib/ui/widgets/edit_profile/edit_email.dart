import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../components/functions.dart';
import '../components/my_custom_nav_bar.dart';
import '/resources/resources.dart';
import '/main.dart';

@RoutePage()
class EditEmailPage extends StatefulWidget {
  const EditEmailPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  EditEmailPageState createState() => EditEmailPageState();
}

class EditEmailPageState extends State<EditEmailPage> {
  late User user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? photoURL;
  String currentEmail = 'example@gmail.com';

  @override
  void initState() {
    if (auth.currentUser != null) {
      user = auth.currentUser!;
      currentEmail = user.email ?? 'example@gmail.com';
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
  void dispose() {
    emailController.dispose();
    emailConfirmController.dispose();
    passwordController.dispose();

    super.dispose();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        bottom: 4.0,
                      ),
                      child: Text(
                        'ТЕКУЩИЙ EMAIL'.tr,
                        style: AppTextStyles.proText,
                      ),
                    ),
                    CupertinoListSection.insetGrouped(
                      // separatorColor: Colors.transparent,
                      margin: const EdgeInsets.all(0),
                      children: [
                        CupertinoListTile(
                          title: Text(
                            currentEmail,
                            style: AppTextStyles.callout.copyWith(
                              color: AppColors.primaryButtons,
                            ),
                          ),
                          padding: AppDimensions.tilePadding,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        bottom: 4.0,
                      ),
                      child: Text(
                        'НОВЫЙ EMAIL'.tr,
                        style: AppTextStyles.proText,
                      ),
                    ),
                    CupertinoListSection.insetGrouped(
                      // separatorColor: Colors.transparent,
                      margin: const EdgeInsets.all(0),
                      children: [
                        CupertinoListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Email'.tr,
                                  style: AppTextStyles.callout,
                                ),
                              ),
                              Expanded(
                                child: CupertinoTextField(
                                  controller: emailController,
                                  textAlign: TextAlign.end,
                                  padding: AppDimensions.edgeInsetsSearch,
                                  decoration: AppBoxDecorations
                                      .editProfileTextDecoration,
                                  placeholder: 'Ввести email'.tr,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            // auth.currentUser.
                          },
                          padding: AppDimensions.tilePadding,
                        ),
                        CupertinoListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Подтвердите Email'.tr,
                                  style: AppTextStyles.callout,
                                ),
                              ),
                              Expanded(
                                child: CupertinoTextField(
                                  controller: emailConfirmController,
                                  textAlign: TextAlign.end,
                                  padding: AppDimensions.edgeInsetsSearch,
                                  decoration: AppBoxDecorations
                                      .editProfileTextDecoration,
                                  placeholder: 'Ввести email'.tr,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            // auth.currentUser.
                          },
                          padding: AppDimensions.tilePadding,
                        ),
                        CupertinoListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Пароль'.tr,
                                  style: AppTextStyles.callout,
                                ),
                              ),
                              Expanded(
                                child: CupertinoTextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  textAlign: TextAlign.end,
                                  padding: AppDimensions.edgeInsetsSearch,
                                  decoration: AppBoxDecorations
                                      .editProfileTextDecoration,
                                  placeholder: 'Ввести пароль'.tr,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            // auth.currentUser.
                          },
                          padding: AppDimensions.tilePadding,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    KeyboardVisibilityBuilder(
                      builder: (context, isKeyboardVisible) {
                        return isKeyboardVisible
                            ? CupertinoButton(
                                padding: const EdgeInsets.only(
                                  right: 16,
                                ),
                                color: AppColors.primaryContainersBackground,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Сохранить'.tr,
                                    style: AppTextStyles.bodyBold.copyWith(
                                      color: AppColors.accentsPrimary,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (emailConfirmController.text !=
                                          emailController.text ||
                                      emailConfirmController.text == '' ||
                                      emailController.text == '') {
                                    showAlertDialog(
                                        context: context,
                                        message: 'Email не совпадает'.tr,
                                        confirmMessage: 'Хорошо'.tr);
                                  } else if (passwordController.text == '') {
                                    showAlertDialog(
                                        context: context,
                                        message: 'Введите пароль'.tr,
                                        confirmMessage: 'Хорошо'.tr);
                                  } else if (auth.currentUser?.email == '') {
                                    final credential =
                                        EmailAuthProvider.credential(
                                            email: emailController.text,
                                            password: passwordController.text);

                                    auth.currentUser
                                        ?.linkWithCredential(credential);
                                  } else if (auth.currentUser?.emailVerified ??
                                      false) {
                                    // auth.currentUser?.unlink(providerId)
                                    auth.currentUser?.updateEmail(
                                        'nnnneo321654@rambler.ru');

                                    auth.currentUser?.updatePassword('111111');
                                  }else{
                                    showAlertDialog(
                                        context: context,
                                        message: 'Подтвердите email , прежде чем обновлять'.tr,
                                        confirmMessage: 'Хорошо'.tr);
                                  }

                                  //
                                  // auth.currentUser?.sendEmailVerification()
                                  // auth.currentUser?.verifyBeforeUpdateEmail('neo321654@rambler.ru');
                                  // auth.currentUser?.updateEmail('neo321654@rambler.ru');

                                  // auth.currentUser?.updatePassword('111111');
                                },
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
