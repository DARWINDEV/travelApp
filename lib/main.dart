import 'package:flutter/material.dart';


import 'package:travel/src/pages/homeScreen_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff3EBACE),
        accentColor: Color(0xffD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7)
      ),
      home: HomeScreenPage()
    );
  }
}