import 'package:cafe_app/models/coffee.dart';
import 'package:cafe_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuDetailScreen extends StatefulWidget {
  final Coffee coffee;
  const MenuDetailScreen({super.key, required this.coffee});

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  //state
  String? type = 'hot';

  @override
  Widget build(BuildContext context) {
    Coffee cof = widget.coffee;
    return Scaffold(
      appBar: AppBar(
        title: Text(cof.title),
        centerTitle: true,
        backgroundColor: Colors.black12,
        leading: BackButton(
          color: Colors.grey,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(Icons.home),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    type == 'hot' ? cof.imageUrl : cof.imageUrl2,
                    fit: BoxFit.cover,
                    height: 230.0,
                    width: 230.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  cof.title,
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  NumberFormat.decimalPattern().format(int.parse(cof.price)) +
                      '원',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Divider(),
          //옵션 선택 영역
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('온도'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChoiceChip(
                    label: Text('hot'),
                    selected: type == 'hot',
                    onSelected: (value) {
                      setState(() {
                        type = 'hot';
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    side: BorderSide(
                      color: type == 'hot' ? Colors.purple : Colors.grey,
                    ),
                  ),
                  ChoiceChip(
                    label: Text('ice'),
                    selected: type == 'ice',
                    onSelected: (value) {
                      setState(() {
                        type = 'ice';
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    side: BorderSide(
                      color: type == 'ice' ? Colors.lightBlue : Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      //-----------------------------body------------------
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              color: Colors.red[50],
            ),
            //최대너비를 사용하는 위젯
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  NumberFormat.decimalPattern().format(int.parse(cof.price)) +
                      '원',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //주문하기 버튼 클릭 시, "주문이 완료되었습니다" 출력.
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('주문확인!'),
                      content: Text('${cof.title}를 주문하시겠습니까?\n${cof.price}원'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('취소'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('확인'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                '주문하기',
                style: TextStyle(color: Colors.red[100], fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
