import 'package:feed_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인 페이지'),
        backgroundColor: Colors.brown,
        titleTextStyle: GoogleFonts.jua(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Container(
        child: Center(
          child: Consumer<UserProvider>(
            builder: (context, user, child) {
              return ElevatedButton(
                child: Text('카카오 로그인'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  foregroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
                onPressed: () async {
                  //카카로 로그인 요청

                  //로그인 여부 확인
                  print('로그인 체크 직전');
                  await user.loginCheck();
                  print('로그인 체크 직후');

                  //사용자 조건 : 카카오톡 설치 여부
                  //비로그인 시 -> 로그인 요청
                  if (!user.isLogin) {
                    isKakaoTalkInstalled().then((value) => {
                          if (value)
                            user.kakaoTalkLogin()
                          else
                            user.kakaoLogin()
                        });
                  } else {
                    //이미 로그인된 상태 -> 로그아웃 화면으로 이동합니다.
                    Navigator.pushReplacementNamed(context, '/logout');
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
