import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('커뮤니티 화면')),
      body: Center(
        child: Text(
          '커뮤니티 화면',
          style: TextStyle(fontSize: 70.0),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            }, child: Text('홈으로')),
            ElevatedButton(onPressed: () {
              Navigator.pushReplacementNamed(context, '/user');
            }, child: Text('마이페이지')),
          ],
        ),
      ),
    );
  }
}