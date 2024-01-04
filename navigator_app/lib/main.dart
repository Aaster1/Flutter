import 'package:flutter/material.dart';
import 'package:navigator_app/screens/community/community_screen.dart';
import 'package:navigator_app/screens/first_screen.dart';
import 'package:navigator_app/screens/home_screen.dart';
import 'package:navigator_app/screens/user/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      initialRoute: '/home',
      routes:{
        '/home' : (context) => HomeScreen(),
        '/user' : (context) => UserScreen(),
        '/community' : (context) => CommunityScreen(),
      },
    );
  }
}
