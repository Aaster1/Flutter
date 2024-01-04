import 'package:flutter/material.dart';

class AnimateScreen extends StatelessWidget {
  const AnimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('애니메이트 페이지 ')),
      body: Center(
        child: Text('animateScreen '),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //이전페이지 돌아가기 (1 > 2)
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_outlined),
      ),
    );
  }
  
}
