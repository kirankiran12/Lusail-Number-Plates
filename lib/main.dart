import 'package:flutter/material.dart';
import 'package:vehicle_project/Auth/register.dart';
import 'package:vehicle_project/Home/home.dart';
import 'package:vehicle_project/Home/plans.dart';
import 'package:vehicle_project/Home/real_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePageScreen());
  }
}
