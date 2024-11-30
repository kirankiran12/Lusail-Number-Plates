import 'package:flutter/material.dart';
import 'package:vehicle_project/Auth/splashscreen.dart';
import 'package:vehicle_project/Home/home.dart';

import 'package:vehicle_project/dashboard.dart/dashboard_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
        title: 'Flutter Demo',debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePageScreen());
        
  }
}