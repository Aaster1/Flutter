import 'package:flutter/material.dart';
import 'package:input_widget/screens/join._screen.dart';
import 'package:input_widget/screens/login._screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    //with SingleTickerProviderStateMixin을 지정하여 vsync의 값을 this로 사용가능하게 해줍니다.
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈 화면')),
      //탭에 해당하는 뷰 세팅
      body: TabBarView(
        children: [
          LoginScreen(),
          JoinScreen(),
        ],
        controller: tabController,
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            child: Text('로그인'),
          ),
          Tab(
            child: Text('회원가입'),
          ),
        ],
        controller: tabController,
      ),
    );
  }
}
