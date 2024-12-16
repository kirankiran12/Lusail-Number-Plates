import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vehicle_project/Auth/loginscreen.dart';
import 'package:vehicle_project/Auth/otp_screen.dart';
import 'package:vehicle_project/Auth/register.dart';
import 'package:vehicle_project/Home/detail_description.dart';
import 'package:vehicle_project/Home/home.dart';
import 'package:vehicle_project/Home/plans.dart';
import 'package:vehicle_project/Home/real_chat.dart';
import 'package:vehicle_project/profileScreen/account_screen.dart';
import 'package:vehicle_project/translate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: AppTranslations(),
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DetailDescription());
  }
}
