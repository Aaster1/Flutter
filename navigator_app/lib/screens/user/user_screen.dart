import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? data = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('유저 화면')),
      body: Center(
        child: Text(
          '유저 화면 ${data}',
          style: TextStyle(fontSize: 50.0),
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
              Navigator.pushReplacementNamed(context, '/community');
            }, child: Text('커뮤니티')),
          ],
        ),
      ),
    );
  }
}
