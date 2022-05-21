import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:states/pages/page_one.dart';
import 'package:states/pages/page_two.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaterialApp',
      initialRoute: '/page_one',
      //routes: {
      //  'page_one': (_) => PageOnePage(),
      //  'page_two' : (_) => PageTwoPage()
      //},
      getPages: [
        GetPage(name: '/page_one', page: () => const PageOnePage()),
        GetPage(name: '/page_two', page: () => const PageTwoPage()),
      ],
    );
  }
}
