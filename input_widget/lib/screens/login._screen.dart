import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? username;
  String? password;
  bool reId = false;
  bool ps = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          const Text(
            '로그인',
            style: TextStyle(fontSize: 32.0),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '아이디',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '비밀번호',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: reId,
                      onChanged: (value) => {
                        setState(() {
                          reId = value!;
                        }),
                      },
                    ),
                    const Text('아이디저장'),
                    Checkbox(
                      value: ps,
                      onChanged: (value) => {
                        setState(() {
                          ps = value!;
                        }),
                      },
                    ),
                    const Text('자동 로그인'),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => {},
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              minimumSize: const Size(double.infinity,40.0)
            ),
            //  ButtonStyle(
            //   backgroundColor: const MaterialStatePropertyAll(Colors.black),
            //   foregroundColor: const MaterialStatePropertyAll(Colors.white),
            //   shape: MaterialStatePropertyAll(
            //     RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20.0),
            //     ),
            //   ),
            //   minimumSize:
            //       MaterialStateProperty.all(const Size(double.infinity, 40.0)),
            // ),
            child: const Text('로그인'),
          ),
        ],
      ),
    );
  }
}
