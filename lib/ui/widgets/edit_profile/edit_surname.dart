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
class EditSurnamePage extends StatefulWidget {
  const EditSurnamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  EditSurnamePageState createState() => EditSurnamePageState();
}

class EditSurnamePageState extends State<EditSurnamePage> {
  late User user;
  late TextEditingController controller;
  final phoneController = TextEditingController();

  String? photoURL;

  bool showSaveButton = false;
  bool isLoading = false;

  String userName = ',';

  @override
  void initState() {
    if (auth.currentUser != null) {
      user = auth.currentUser!;

      if(user.displayName !=''){
        // List<String> nameLastFirst = user.displayName!.split(',');
        userName = user.displayName??',';

      }
      List<String> nameLastFirst = userName.split(',');
      controller = TextEditingController(text:nameLastFirst[1]);

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
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24.0,
                    ),
                    CupertinoTextField(
                      padding: AppDimensions.edgeInsetsSearch,
                      decoration: AppBoxDecorations.editProfileTextDecoration,
                      // keyboardType: TextInputType.number,
                      // obscureText: isHidePassword,
                      placeholder: (controller.text == '')
                          ? widget.title
                          : controller.text,
                      controller: controller,
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

                                 List<String> namesList = userName.split(',');

                                  user.updateDisplayName('${namesList[0]},${controller.text}')
                                      .then((value) => context.router.pop());
                                  // user.updateDisplayName('')
                                  //     .then((value) => context.router.pop());
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
