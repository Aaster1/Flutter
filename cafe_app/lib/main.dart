import 'package:cafe_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joeun Cafe', //App title
      debugShowCheckedModeBanner: false,  //디버그 리본 삭제 - 이것은, 현재 앱이 개발중이라는 표시입니다.
      home: MyHomePage(),
    );
  }
}

