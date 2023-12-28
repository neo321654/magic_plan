import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '/ui/widgets/my_app.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

//todo исправить
late final FirebaseApp appFire;
late final FirebaseAuth auth;

//commit return to mac

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // We store the app and auth to make testing with a named instance easier.
  appFire = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  auth = FirebaseAuth.instanceFor(app: appFire);

  const app = MyApp();
  runApp(app);
}
