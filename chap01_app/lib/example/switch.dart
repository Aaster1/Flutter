import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
    var switchValue = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //디버그 리본 숨기기
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home : 메인(홈) 화면을 지정하는 속성입니다.
      home: Scaffold(
        body: Center(
            child: Switch(
          value: switchValue,
          onChanged: (value) {
            setState(() {
              switchValue = value;
              print(switchValue);
            });
          }
        )),
      ),
    );
  }
}


