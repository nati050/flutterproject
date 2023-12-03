import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectfluttar/pages/page2.dart';
//import 'package:projectfluttar/pages/page1.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: countrieslist()),
      // countries(),
    );
  }
}
