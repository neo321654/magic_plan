import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '/ui/widgets/my_app.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

//todo исправить
late final FirebaseApp appFire;
late final FirebaseAuth auth;

//todo убрать перед публикацией
late final Talker talker;

//commit return to mac

void main() async{
  talker = TalkerFlutter.init();

  FlutterError.onError = (details) => talker.handle(
    details.exception,
    details.stack,
  );
  PlatformDispatcher.instance.onError=(er,stack) {
    talker.handle(er, stack);
    return true;
  };
  runZonedGuarded(() async {
  WidgetsFlutterBinding.ensureInitialized();

  // We store the app and auth to make testing with a named instance easier.
  appFire = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  auth = FirebaseAuth.instanceFor(app: appFire);




    runApp(MyApp());
  }, (error, stack) {
    talker.handle(error, stack);
  });
}
