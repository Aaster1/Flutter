import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfinityScreen extends StatefulWidget {
  const InfinityScreen({super.key});

  @override
  State<InfinityScreen> createState() => _InfinityScreenState();
}

class _InfinityScreenState extends State<InfinityScreen> {
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

  //스크롤 컨트롤러에서는 스크롤에 대한 조정함수가 내장되어 있습니다.
  final ScrollController _infController = ScrollController();

  // Future _refresh() async {
  //   print('이것은 새로고침이여');
  // }

  @override
  void initState() {
    super.initState();

    _infController.addListener(() {
      //maxScrollExtent : 스크롤 위치의 최댓값
      // offset : 현재 스크롤 위치
      if (_infController.position.maxScrollExtent == _infController.offset) {
        //데이터 요청(다음 페이지)
        fetch();
      }
    });
  }

  int _tempNum = 21;
  int _page = 1;
  var _pageObject = {};

  Future fetch() async {
    print('fetched');
    //http
    //1. URL 인코딩
    //2. GET 방식 요청
    // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final url = Uri.parse('http://localhost:8080/board');
    final response = await http.get(url);
    final result = json.decode(response.body);
    final page = result['page'];
    final List newData = result['list'];
    setState(() {
      items.addAll(newData.map<String>((item) {
        final boardNo = item['boardNo'];
        final title = item['title'];
        return 'Item ${boardNo} - ${title}';
      }));
      _pageObject = page;
      _page++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinity Scroll'),
      ),
      body: ListView.builder(
        controller: _infController,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          if (index < items.length) {
            final item = items[index];
            return ListTile(
              title: Text(item),
            );
          } else if (_pageObject['last']!=null &&_pageObject['last'] > _page) {
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
    );
  }
}
