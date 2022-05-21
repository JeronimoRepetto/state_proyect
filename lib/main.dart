import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/pages/page_one.dart';
import 'package:states/pages/page_two.dart';
import 'package:states/services/user_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MaterialApp',
        initialRoute: 'page_one',
        routes: {
          'page_one': (_) => PageOnePage(),
          'page_two': (_) => PageTwoPage()
        },
      ),
    );
  }
}
