import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'core/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Check if a user is already signed in
  User? currentUser = FirebaseAuth.instance.currentUser;
  print(currentUser?.email);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp(currentUser: currentUser));
  });
}

class MyApp extends StatelessWidget {
  final User? currentUser;

  const MyApp({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      title: 'onjobb',
      initialBinding: InitialBindings(),
      initialRoute: currentUser == null
          ? AppRoutes.loginScreen
          : AppRoutes.homeContainerScreen,
      getPages: AppRoutes.pages,
    );
  }
}
