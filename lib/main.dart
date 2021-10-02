import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_cct/app_pages.dart';
import 'package:untitled_cct/controller/controller.dart';
import 'package:untitled_cct/ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    initialRoute: "/",
  ));
}