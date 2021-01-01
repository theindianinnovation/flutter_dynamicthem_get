import 'package:flutter/material.dart';
import 'package:flutter_dynamictheme_get/firstScreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init(); //get storage initialization
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themedata = GetStorage();
  @override
  Widget build(BuildContext context) {
    bool darkMode = themedata.read('darkmode')??false;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkMode ? ThemeData.dark() : ThemeData.light(),
      home: FirstScreen(), //Your home page,
    );
  }
}
