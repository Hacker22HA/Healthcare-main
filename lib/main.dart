import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/widgets/mainWidget/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD9jzXOHfkX63Hk2DKffHsgEg58U21lOQ4",
          authDomain: "healthcare-app-13489.firebaseapp.com",
          projectId: "healthcare-app-13489",
          storageBucket: "healthcare-app-13489.firebasestorage.app",
          messagingSenderId: "571185554533",
          appId: "1:571185554533:web:40e8b9e0c83686c05a528c"));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Care',
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
