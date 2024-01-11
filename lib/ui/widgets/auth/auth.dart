// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magic_plan/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/functions.dart';
import '/main.dart';
import 'package:flutter/material.dart';

class ScaffoldSnackbar {
  ScaffoldSnackbar(this._context);

  factory ScaffoldSnackbar.of(BuildContext context) {
    return ScaffoldSnackbar(context);
  }

  final BuildContext _context;

  void show(String message) {
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}

enum AuthMode { phone }

@RoutePage()
class AuthGatePage extends StatefulWidget {
  const AuthGatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthGatePageState();
}

class _AuthGatePageState extends State<AuthGatePage> {
  TextEditingController phoneController =
      TextEditingController(text: '+79853085859');

  // TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController =
      TextEditingController(text: '111111');

  // TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String error = '';
  String verificationId = '';

  AuthMode mode = AuthMode.phone;

  bool isLoading = false;
  bool isHidePassword = true;
  bool isSendCode = true;
  bool isButtonLock = true;
  String passwordPlaceholder = 'Пароль из смс'.tr;
  bool isErrorToPlaceholder = false;

  @override
  void initState() {
    super.initState();

    phoneController.addListener(() {
      setState(() {
        if (phoneController.text == '') {
          isButtonLock = true;
        } else {
          isButtonLock = false;
        }
        ;
      });

      talker.debug(phoneController.text);
    });
  }

  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
  void changePlaceHolder() {
    setState(() {
      if(isErrorToPlaceholder){
        passwordPlaceholder = 'Пароль из смс'.tr;
      }else{
        passwordPlaceholder = 'Это неправильный пароль'.tr;
      }
    });
  }

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
                    "Вход в Аккаунт".tr,
                    style: AppTextStyles.proDisplay,
                  ),
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Visibility(Visibility
                      //   visible: error.isNotEmpty,
                      //   child: MaterialBanner(
                      //     backgroundColor: Theme.of(context).colorScheme.error,
                      //     content:
                      //         SelectableText('Ошибка для отладки : \n$error'),
                      //     actions: [
                      //       TextButton(
                      //         onPressed: () {
                      //           setState(() {
                      //             error = '';
                      //           });
                      //         },
                      //         child: Text(
                      //           'скрыть'.tr,
                      //           style: const TextStyle(color: Colors.white),
                      //         ),
                      //       ),
                      //     ],
                      //     contentTextStyle:
                      //         const TextStyle(color: Colors.white),
                      //     padding: const EdgeInsets.all(10),
                      //   ),
                      // ),
                      const SizedBox(height: 20),

                      CupertinoTextField(
                        padding: AppDimensions.edgeInsetsSearch,
                        decoration: AppBoxDecorations.editTextDecoration,
                        placeholderStyle: AppTextStyles.callout
                            .copyWith(color: AppColors.primaryButtons),
                        keyboardType: TextInputType.phone,
                        placeholder: 'Ваш номер телефона'.tr,
                        controller: phoneController,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),

                      CupertinoTextField(
                        padding: AppDimensions.edgeInsetsSearch,
                        decoration: AppBoxDecorations.editTextDecoration,
                        keyboardType: TextInputType.number,
                        obscureText: isHidePassword,
                        placeholderStyle: isErrorToPlaceholder? AppTextStyles.callout
                            .copyWith(color: AppColors.primaryButtons):AppTextStyles.callout
                            .copyWith(color: AppColors.systemComment),
                        placeholder: passwordPlaceholder,
                        controller: passwordController,
                        suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidePassword = !isHidePassword;
                            });
                          },
                          child: !isHidePassword
                              ? SvgPicture.asset(AppImages.open_yey)
                              : SvgPicture.asset(AppImages.closed_yey),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      SizedBox(
                        width: double.infinity,
                        // height: 50,
                        child: CupertinoButton(
                          disabledColor: AppColors.primaryIcons,
                          borderRadius: BorderRadius.circular(13.0),
                          color: AppColors.accentsPrimary,
                          onPressed: isButtonLock
                              ? null
                              : !isSendCode
                                  ? () {
                                      //todo добавить проверку на поля
                                      _sendCode(
                                          verId: verificationId,
                                          smsCode: passwordController.text);
                                    }
                                  : () {
                                      setState(() {
                                        isSendCode = !isSendCode;
                                      });
                                      _handleMultiFactorException(
                                        _emailAndPassword,
                                      );
                                    },
                          child: isLoading
                              ? const CircularProgressIndicator.adaptive()
                              : isSendCode
                                  ? Text(
                                      'Получить код'.tr,
                                      style: AppTextStyles.bodyBoldWhite,
                                    )
                                  : Text(
                                      'Отправить код'.tr,
                                      style: AppTextStyles.bodyBoldWhite,
                                    ),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Продолжая, вы соглашаетесь с '.tr,
                          style: AppTextStyles.caption1,
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(Uri.parse('https://flutter.dev'));
                                  talker
                                      .debug('Политикой Конфиденциальности'.tr);
                                },
                              text: 'Политикой Конфиденциальности'.tr,
                              style: AppTextStyles.caption1.copyWith(
                                color: AppColors.accentsPrimary,
                              ),
                            ),
                            TextSpan(
                              text: ' и '.tr,
                              style: AppTextStyles.caption1,
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(Uri.parse('https://flutter.dev'));
                                  talker.debug('Условиями Использования'.tr);
                                },
                              text: 'Условиями Использования'.tr,
                              style: AppTextStyles.caption1.copyWith(
                                color: AppColors.accentsPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleMultiFactorException(
    Future<void> Function() authFunction,
  ) async {
    setIsLoading();
    showAlertDialog(
        context: context,
        message: 'Введите код из смс в поле код для авторизации.'.tr,
        confirmMessage: 'Хорошо'.tr);

    try {
      await authFunction();
    } on FirebaseAuthMultiFactorException catch (e) {
      setState(() {
        talker.debug(e.message);
        error = '${e.message}';
      });
      final firstTotpHint = e.resolver.hints
          .firstWhereOrNull((element) => element is TotpMultiFactorInfo);
      if (firstTotpHint != null) {
        final code = await getSmsCodeFromUser(context);
        final assertion = await TotpMultiFactorGenerator.getAssertionForSignIn(
          firstTotpHint.uid,
          code!,
        );
        await e.resolver.resolveSignIn(assertion);
        return;
      }

      final firstPhoneHint = e.resolver.hints
          .firstWhereOrNull((element) => element is PhoneMultiFactorInfo);

      if (firstPhoneHint is! PhoneMultiFactorInfo) {
        return;
      }
      await auth.verifyPhoneNumber(
        multiFactorSession: e.resolver.session,
        multiFactorInfo: firstPhoneHint,
        verificationCompleted: (_) {},
        verificationFailed: print,
        codeSent: (String verificationId, int? resendToken) async {
          final smsCode = await getSmsCodeFromUser(context);

          if (smsCode != null) {
            // Create a PhoneAuthCredential with the code
            final credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: smsCode,
            );

            try {
              await e.resolver.resolveSignIn(
                PhoneMultiFactorGenerator.getAssertion(
                  credential,
                ),
              );
            } on FirebaseAuthException catch (e) {
              print(e.message);
            }
          }
        },
        codeAutoRetrievalTimeout: print,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        talker.debug(e.message);
        error = '${e.message}';
      });
    } catch (e) {
      setState(() {
        error = '$e';
      });
    }
    setIsLoading();
  }

  Future<void> _emailAndPassword() async {
    if (formKey.currentState?.validate() ?? false) {
      await _phoneAuth();
    }
  }

  Future<void> _phoneAuth() async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (credential) {},
      verificationFailed: (e) {
        setState(() {
          talker.debug(e.message);
          error = '${e.message}';
        });
      },
      codeSent: (String verificationIdloc, int? resendToken) async {
        verificationId = verificationIdloc;

        talker.debug('codeSent');
        // final smsCode = await getSmsCodeFromUser(context);
      },
      codeAutoRetrievalTimeout: (e) {
        talker.error('codeAutoRetrievalTimeout $e');
        if (mounted) {
          setState(() {
            talker.debug(e);
            error = e;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _sendCode(
      {required String verId, required String smsCode}) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: smsCode,
    );

    try {
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        context.router.popUntilRoot();
      }
    } on FirebaseAuthException catch (e) {

        passwordController.text = '';
        changePlaceHolder();



      // showAlertDialog(
      //     context: context,
      //     message: 'Error'.tr,
      //     confirmMessage: 'Хорошо'.tr);

      setState(() {
        error = e.message ?? '';
      });
    }
  }
}

Future<String?> getSmsCodeFromUser(BuildContext context) async {
  return '111111';
}
