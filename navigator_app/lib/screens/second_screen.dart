import 'package:flutter/material.dart';
import 'package:navigator_app/models/user.dart';

class SecondScreen extends StatelessWidget {
  //생성자
  //:클래스와 이름이 같은 메소드 - 객체 생성 시 호출합니다.
  //생성자({})
  //{} : 선택적 매개변수를 지원하는 문법입니다.

  //this : 객체 자기 자신
  //super : 부모 객체
  //require : 해당 매개변수의 필수 여부 옵션

  final User user;
  const SecondScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('두번째 페이지 ')),
      body: Center(
        child: Text('secondScreen ${user.id} ${user.name}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //이전페이지 돌아가기 (1 > 2)
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_outlined),
      ),
    );
  }
}