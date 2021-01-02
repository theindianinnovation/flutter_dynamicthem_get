import 'package:flutter/material.dart';
import 'package:flutter_dynamictheme_get/first_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final themedata = GetStorage();

void main() async {
  await GetStorage.init(); //get storage initialization
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool darkMode = themedata.read('darkmode') ?? false;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkMode ? ThemeData.dark() : ThemeData.light(),
      home: FirstScreen(), //Your home page,
    );
  }
}
