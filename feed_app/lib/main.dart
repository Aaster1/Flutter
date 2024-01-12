import 'package:feed_app/provider/user_provider.dart';
import 'package:feed_app/screens/login_screen.dart';
import 'package:feed_app/screens/logout_screen.dart';
import 'package:feed_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

void main() {
// 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

// runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
//앱 용
    nativeAppKey: '50e30f7e1fa12c3cb29d5f0f82bbb1bb',
//웹 용
    // javaScriptAppKey: 'cf16f58ac7d59c8c7694b44dd9e8457c',
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/logout': (context) => LogoutScreen(),
      },
    );
  }
}
