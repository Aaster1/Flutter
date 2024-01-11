import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PullScreen extends StatefulWidget {
  const PullScreen({super.key});

  @override
  State<PullScreen> createState() => _PullScreenState();
}

class _PullScreenState extends State<PullScreen> {
  List<String> items = [
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
    'item6',
    'item7',
    'item8',
    'item9',
    'item10',
    'item11',
    'item12',
    'item13',
    'item14',
    'item15',
    'item16',
    'item17',
    'item18',
    'item19',
    'item20',
  ];

  Future _refresh() async {
    fetch();
  }

  int _tempNum = 21;

  Future fetch() async {
    print('fetched');
    //http
    //1. URL 인코딩
    //2. GET 방식 요청
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    final List newData = json.decode(response.body);
    setState(() {
      List<String> newList = newData.map<String>((item) {
        final id = item['id'];
        final title = item['title'];
        return 'Item ${id} - ${title}';
      }).toList();
      items = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pull Reload'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            if (index < items.length) {
              final item = items[index];
              return ListTile(
                title: Text(item),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          itemCount: items.length + 1,
        ),
      ),
    );
  }
}
