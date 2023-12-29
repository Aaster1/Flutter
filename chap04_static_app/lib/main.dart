import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //앱 바
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text('Hello Flutter~!'),
      ),
      //FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('clicked!');
        },
        child: const Icon(Icons.edit),
      ), //body
      //drawer
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('메뉴 목록'),
            ),
            ListTile(
              title: const Text('메뉴 1'),
              onTap: () {
                print('click menu1!');
              },
            ),
            ListTile(
              title: const Text('메뉴 2'),
              onTap: () {
                print('click menu2!');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'user'),
        ],
      ),
      bottomSheet: Container(
        height: 20,
        color: Colors.grey,
        child: const Center(
          child: Text('Bottom'),
        ),
      ),
    );
  }
}
