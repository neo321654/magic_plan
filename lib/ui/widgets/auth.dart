// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String error = '';
  String verificationId = '';

  AuthMode mode = AuthMode.phone;

  bool isLoading = false;

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
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SafeArea(
                  child: Form(
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
                              content: SelectableText(error),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      error = '';
                                    });
                                  },
                                  child: const Text(
                                    'dismiss',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                              contentTextStyle:
                                  const TextStyle(color: Colors.white),
                              padding: const EdgeInsets.all(10),
                            ),
                          ),
                          const SizedBox(height: 20),

                          CupertinoTextField(
                            controller: phoneController,
                            // decoration: const InputDecoration(
                            //   hintText: '+72345678910',
                            //   labelText: 'Phone number',
                            //   border: OutlineInputBorder(),
                            // ),
                          //   validator: (value) =>
                          //   value != null && value.isNotEmpty
                          //       ? null
                          //       : 'Required',
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () => _handleMultiFactorException(
                                        _emailAndPassword,
                                      ),
                              child: isLoading
                                  ? const CircularProgressIndicator.adaptive()
                                  : const Text('войти'),
                            ),
                          ),
                          TextButton(
                            onPressed: _resetPassword,
                            child: const Text('Forgot password?'),
                          ),

                          // SizedBox(
                          //   width: double.infinity,
                          //   height: 50,
                          //   child: OutlinedButton(
                          //     onPressed: isLoading
                          //         ? null
                          //         : () {
                          //             if (mode != AuthMode.phone) {
                          //               setState(() {
                          //                 mode = AuthMode.phone;
                          //               });
                          //             } else {
                          //               setState(() {
                          //                 mode = AuthMode.login;
                          //               });
                          //             }
                          //           },
                          //     child: isLoading
                          //         ? const CircularProgressIndicator.adaptive()
                          //         : Text(
                          //             mode != AuthMode.phone
                          //                 ? 'Sign in with Phone Number'
                          //                 : 'Sign in with Email and Password',
                          //           ),
                          //   ),
                          // ),

                          // const SizedBox(height: 20),
                          // if (mode != AuthMode.phone)
                          //   RichText(
                          //     text: TextSpan(
                          //       style: Theme.of(context).textTheme.bodyLarge,
                          //       children: [
                          //         TextSpan(
                          //           text: mode == AuthMode.login
                          //               ? "Don't have an account? "
                          //               : 'You have an account? ',
                          //         ),
                          //         TextSpan(
                          //           text: mode == AuthMode.login
                          //               ? 'Register now'
                          //               : 'Click to login',
                          //           style: const TextStyle(color: Colors.blue),
                          //           recognizer: TapGestureRecognizer()
                          //             ..onTap = () {
                          //               setState(() {
                          //                 mode = mode == AuthMode.login
                          //                     ? AuthMode.register
                          //                     : AuthMode.login;
                          //               });
                          //             },
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                        ],
                      ),
                    ),
                  ),
                ),
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
    try {
      await authFunction();
    } on FirebaseAuthMultiFactorException catch (e) {
      setState(() {
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

        Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);

      },
      verificationFailed: (e) {
        setState(() {
          error = '${e.message}';
        });
      },
      codeSent: (String verificationId, int? resendToken) async {
        final smsCode = await getSmsCodeFromUser(context);

        if (smsCode != null) {
          // Create a PhoneAuthCredential with the code
          final credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );

          try {
            // Sign the user in (or link) with the credential
            UserCredential userCredential =    await auth.signInWithCredential(credential);
           if (userCredential.user != null){
             Navigator.of(context).pushNamedAndRemoveUntil('greeting', (route) => false);

           }
          } on FirebaseAuthException catch (e) {
            setState(() {
              error = e.message ?? '';
            });
          }
        }
      },
      codeAutoRetrievalTimeout: (e) {
        setState(() {
          error = e;
        });
      },
    );
  }
}

Future<String?> getSmsCodeFromUser(BuildContext context) async {
  String? smsCode;

  // await showDialog<String>
  //   (
  //   context: context,
  //   barrierDismissible: false,
  //   builder: (context)
  //   {
  //
  //     return AlertDialog(
  //       title: const Text('SMS code:'),
  //       actions: [
  //         ElevatedButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('Sign in'),
  //         ),
  //         OutlinedButton(
  //           onPressed: () {
  //             smsCode = null;
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('Cancel'),
  //         ),
  //       ],
  //       content: Container(
  //         padding: const EdgeInsets.all(20),
  //         child: TextField(
  //           onChanged: (value) {
  //             smsCode = value;
  //           },
  //           textAlign: TextAlign.center,
  //           autofocus: true,
  //         ),
  //       ),
  //     );
  //   },
  // );

  return '111111';
}

