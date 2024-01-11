// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:magic_plan/resources/resources.dart';
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

  @override
  void initState() {
    super.initState();
  }

  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 8.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
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
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: error.isNotEmpty,
                            child: MaterialBanner(
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                              content: SelectableText(
                                  'Ошибка для отладки : \n$error'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      error = '';
                                    });
                                  },
                                  child: Text(
                                    'скрыть'.tr,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                              contentTextStyle:
                                  const TextStyle(color: Colors.white),
                              padding: const EdgeInsets.all(10),
                            ),
                          ),
                          const SizedBox(height: 20),
                          !isSendCode
                              ? const SizedBox.shrink()
                              : CupertinoTextField(
                                  padding: AppDimensions.edgeInsetsSearch,
                                  decoration:
                                      AppBoxDecorations.editTextDecoration,
                                  placeholderStyle: AppTextStyles.callout,
                                  keyboardType: TextInputType.phone,
                                  placeholder: '+71234567899'.tr,
                                  controller: phoneController,
                                ),
                          isSendCode
                              ? const SizedBox.shrink()
                              : CupertinoTextField(
                                  padding: AppDimensions.edgeInsetsSearch,
                                  decoration:
                                      AppBoxDecorations.editTextDecoration,
                                  keyboardType: TextInputType.number,
                                  obscureText: isHidePassword,
                                  placeholder: 'Код из смс'.tr,
                                  controller: passwordController,
                                  suffix: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isHidePassword = !isHidePassword;
                                      });
                                    },
                                    child: isHidePassword
                                        ? const Icon(CupertinoIcons.plus)
                                        : const Icon(CupertinoIcons.minus),
                                  ),
                                ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            // height: 50,
                            child: CupertinoButton(
                              color: AppColors.accentsPrimary,
                              onPressed: isLoading
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
                                      ? Text('Получить код'.tr)
                                      : Text('Отправить код'.tr),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _resetPassword() async {
    String? email;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Send'),
            ),
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your email'),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
              ),
            ],
          ),
        );
      },
    );

    if (email != null) {
      try {
        await auth.sendPasswordResetEmail(email: email!);
        ScaffoldSnackbar.of(context).show('Password reset email is sent');
      } catch (e) {
        ScaffoldSnackbar.of(context).show('Error resetting');
      }
    }
  }

  Future<void> _handleMultiFactorException(
    Future<void> Function() authFunction,
  ) async {
    setIsLoading();
    showAlertDialog(context: context,message:'Введите код из смс в поле код для авторизации.'.tr,confirmMessage:'Хорошо'.tr);

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
      verificationCompleted: (credential) {
        print('!!!!!dfdf');
       // context.router.navigateNamed('/root');
       // context.router.navigate(AuthInTabBarWidgetRoute());

      },
      verificationFailed: (e) {
        setState(() {
          talker.debug(e.message);
          error = '${e.message}';
        });
      },
      codeSent: (String verificationIdloc, int? resendToken) async {
        verificationId = verificationIdloc;

        // final smsCode = await getSmsCodeFromUser(context);
      },
      codeAutoRetrievalTimeout: (e) {
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
    // TODO: implement dispose
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
        // context.router.popUntilRoot();
        // context.router.popAndPush(const AuthInTabBarWidgetRoute());
        // context.router.push(AuthInTabBarWidgetRoute());
        //todo replace не работает
        // context.router.replace(AuthInTabBarWidgetRoute());
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message ?? '';
      });
    }
  }
}

Future<String?> getSmsCodeFromUser(BuildContext context) async {
  String? smsCode;



  return '111111';
}





// void _showAlertDialog(BuildContext context) {
//   showCupertinoModalPopup<void>(
//     context: context,
//     builder: (BuildContext context) => CupertinoAlertDialog(
//       // title: const Text('Alert'),
//       content: Text('Введите код из смс в поле код для авторизации.'.tr),
//       actions: <CupertinoDialogAction>[
//         CupertinoDialogAction(
//           isDestructiveAction: false,
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Хорошо'.tr),
//         ),
//       ],
//     ),
//   );
// }
