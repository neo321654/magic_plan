import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../components/my_custom_nav_bar.dart';
import '/resources/resources.dart';
import '../auth/auth.dart';
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
  late TextEditingController controller;
  final phoneController = TextEditingController();

  String? photoURL;

  bool showSaveButton = false;
  bool isLoading = false;

  String userName = ',';
  String currentEmail = 'example@gmail.com';

  @override
  void initState() {
    if (auth.currentUser != null) {
      user = auth.currentUser!;
      currentEmail = user.email??'example@gmail.com';

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
   //todo remove all controllers

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
                                  textAlign: TextAlign.end,
                                  padding: AppDimensions.edgeInsetsSearch,
                                  decoration: AppBoxDecorations.editProfileTextDecoration,
                                  // keyboardType: TextInputType.number,
                                  // obscureText: isHidePassword,
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
                          title: Text(
                            'Подтвердите Email'.tr,
                            style: AppTextStyles.callout,
                          ),
                          additionalInfo: Text(
                            'Ввести email'.tr,
                            style: AppTextStyles.callout
                                .copyWith(color: AppColors.primaryIcons),
                          ),
                          onTap: () {
                            // context.router.push(
                            //     EditEmailRoute(title: 'Смена email'.tr)).then((value){
                            //   setState(() {
                            //     updateData();
                            //   });
                            // });
                          },
                          padding: AppDimensions.tilePadding,
                        ),
                        CupertinoListTile(
                          title: Text(
                            'Пароль'.tr,
                            style: AppTextStyles.callout,
                          ),
                          additionalInfo: Text(
                            'Ввести пароль'.tr,
                            style: AppTextStyles.callout
                                .copyWith(color: AppColors.primaryIcons),
                          ),
                          onTap: () {
                            // context.router.push(
                            //     EditEmailRoute(title: 'Смена email'.tr)).then((value){
                            //   setState(() {
                            //     updateData();
                            //   });
                            // });
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
                                
                                  // auth.signInWithEmailAndPassword(email: email, password: password)
                                  // auth.createUserWithEmailAndPassword(email: email, password: password)
                                  // auth.currentUser.linkWithCredential(provider)


                                  final credential =
                                  EmailAuthProvider.credential(email: 'neo321654@rambler.ru', password: '111111');
                                  auth.currentUser?.linkWithCredential(credential);

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