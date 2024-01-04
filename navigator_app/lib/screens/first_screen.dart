import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';
import 'package:navigator_app/screens/animate_screen.dart';
import 'package:navigator_app/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User(id: 'joeun', name: '김조은');
    return Scaffold(
      appBar: AppBar(title: Text('첫 페이지')),
      body: Center(
        child: Text('firstScreen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //페이지 이동하기 (1 > 2)
          Navigator.push(context, _createRoute());
        },
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      //이동할 페이지 지정 : pageBuilder
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AnimateScreen(),
      //애니메이션 지정 : transitionBuilder
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //시작점
        const begin = Offset(0.0, 1.0);
        //끝지점
        const end = Offset.zero;
        //타이밍함수
        const curve = Curves.ease;
        //애니메이션 적용
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        //애니메이션 적용2
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
