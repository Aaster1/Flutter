import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('홈 화면')),
      body: Center(
        child: Text(
          '홈 화면',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pushReplacementNamed(context, '/user',arguments: 'user');
            }, child: Text('마이페이지')),
            ElevatedButton(onPressed: () {
              Navigator.pushReplacementNamed(context, '/community', arguments: 'community');
            }, child: Text('커뮤니티')),
          ],
        ),
      ),
    );
  }
}
