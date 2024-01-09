import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../navigation/app_router.dart';
import '../components/my_custom_nav_bar.dart';
import '../components/widgets.dart';
import '/resources/resources.dart';
import '/main.dart';
import 'package:flutter/material.dart';

const placeholderImage =
    'https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late User user;
  final phoneController = TextEditingController();

  String? photoURL;

  bool showSaveButton = false;
  bool isLoading = false;

  String userName = ',';
  String name = '';
  String surname = '';

  @override
  void initState() {

    updateData();

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

  void updateData() {
     if (auth.currentUser != null) {
      user = auth.currentUser!;
      userName = user.displayName ?? ',';
      List<String> namesList = userName.split(',');
      if(namesList.length == 2){
        name = namesList[0];
        surname = namesList[1];
      }

    }
  }

  void setIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  List get userProviders => user.providerData.map((e) => e.providerId).toList();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: AppColors.primaryMainBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              //todo решить проблемму с тайтлом предыдущей проблеммы
              delegate: MyNavBar(
                title: 'Аккаунт'.tr,
                prevTitle: 'Мой аккаунт'.tr,
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
                      const Stack(
                        children: [
                          // CircleAvatar(
                          //   maxRadius: 60,
                          //   backgroundImage: NetworkImage(
                          //     user.photoURL ?? placeholderImage,
                          //   ),
                          // ),
                          // Positioned.directional(
                          //   textDirection: Directionality.of(context),
                          //   end: 0,
                          //   bottom: 0,
                          //   child: Material(
                          //     clipBehavior: Clip.antiAlias,
                          //     color: Theme.of(context).colorScheme.secondary,
                          //     borderRadius: BorderRadius.circular(40),
                          //     child: InkWell(
                          //       onTap: () async {
                          //         final photoURL = await getPhotoURLFromUser();
                          //
                          //         if (photoURL != null) {
                          //           await user.updatePhotoURL(photoURL);
                          //           // await user.updateEmail('neo3224@ram.ru');
                          //           await user
                          //               .updateDisplayName('NNNNAAMMMEmail');
                          //         }
                          //       },
                          //       radius: 50,
                          //       child: const SizedBox(
                          //         width: 35,
                          //         height: 35,
                          //         child: Icon(Icons.edit),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(

                        auth.currentUser?.email??'',
                        style: AppTextStyles.caption1,
                      ),
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
                                (name == '') ? 'Настроить'.tr : name,
                                style: AppTextStyles.callout
                                    .copyWith(color: AppColors.primaryButtons),
                              ),
                              trailing: const RightArrowWidget(),
                              onTap: () {
                                context.router
                                    .push(EditNameRoute(title: 'Ваше Имя'.tr))
                                    .then((value){
                                      setState(() {
                                        updateData();
                                      });
                                });
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
                                (surname == '') ? 'Настроить'.tr : surname,
                                style: AppTextStyles.callout
                                    .copyWith(color: AppColors.primaryButtons),
                              ),
                              trailing: const RightArrowWidget(),
                              onTap: () {
                                context.router.push(
                                    EditSurnameRoute(title: 'Ваша Фамилия'.tr)).then((value){
                                  setState(() {
                                    updateData();
                                  });
                                });
                              },
                              padding: AppDimensions.tilePadding,
                            ),
                            CupertinoListTile(
                              title: Text(
                                'Телефон'.tr,
                                style: AppTextStyles.callout,
                              ),
                              additionalInfo: Text(
                                user.phoneNumber ?? '+7(111)1111111',
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
                              context.router.push(
                                  EditEmailRoute(title: 'Смена email'.tr)).then((value){
                                setState(() {
                                  updateData();
                                });
                              });
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
                            trailing: const RightArrowWidget(),
                            onTap: () {

                              context.router.push(
                                  DeleteProfileRoute(title: 'Удаление'.tr)).then((value){
                                setState(() {
                                  updateData();
                                });
                              });
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
