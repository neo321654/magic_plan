import 'dart:developer';
import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../components/my_custom_nav_bar.dart';
import '/resources/resources.dart';
import '../auth/auth.dart';
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
  late TextEditingController controller;
  final phoneController = TextEditingController();

  String? photoURL;

  bool showSaveButton = false;
  bool isLoading = false;

  @override
  void initState() {
    //todo сюда нельзя поподать из других экранов
    if(auth.currentUser!=null){
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

    log(user.toString());

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
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: CupertinoPageScaffold(
        child:
      CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              //todo решить проблемму с тайтлом предыдущей проблеммы
              delegate: MyNavBar(title: 'Аккаунт'.tr,prevTitle:'Мой аккаунт'.tr,),
              pinned: true,
              floating: false,

            ),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 400,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  maxRadius: 60,
                                  backgroundImage: NetworkImage(
                                    user.photoURL ?? placeholderImage,
                                  ),
                                ),
                                Positioned.directional(
                                  textDirection: Directionality.of(context),
                                  end: 0,
                                  bottom: 0,
                                  child:
                                  Material(
                                    clipBehavior: Clip.antiAlias,
                                    color: Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(40),
                                    child: InkWell(
                                      onTap: () async {
                                        final photoURL = await getPhotoURLFromUser();

                                        if (photoURL != null) {
                                          await user.updatePhotoURL(photoURL);
                                          // await user.updateEmail('neo3224@ram.ru');
                                          await user.updateDisplayName('NNNNAAMMMEmail');
                                        }
                                      },
                                      radius: 50,
                                      child: const SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Icon(Icons.edit),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CupertinoTextField(
                              textAlign: TextAlign.center,
                              controller: controller,
                              placeholder: 'Click to add a display name'.tr,

                            ),
                            Text(user.email ?? user.phoneNumber ?? 'User'),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (userProviders.contains('phone'))
                                  const Icon(Icons.phone),
                                if (userProviders.contains('password'))
                                  const Icon(Icons.mail),
                                if (userProviders.contains('google.com'))
                                  SizedBox(
                                    width: 24,
                                    child: Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png',
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // TextButton(
                            //   onPressed: () {
                            //     user.sendEmailVerification();
                            //   },
                            //   child: const Text('Verify Email'),
                            // ),

                            CupertinoTextField(
                              controller: phoneController,
                              suffix: const Icon(Icons.phone),
                              placeholder: 'Phone number',
                            ),


                            const Divider(),
                            TextButton(
                              onPressed: _signOut,
                              child:  Text('Выйти'.tr),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    end: 40,
                    top: 40,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: !showSaveButton
                          ? SizedBox(key: UniqueKey())
                          : TextButton(
                        onPressed: isLoading ? null : updateDisplayName,
                        child: const Text('Save changes'),
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
      )


      ),
    );
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
