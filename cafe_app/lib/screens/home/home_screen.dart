import 'package:cafe_app/screens/menu/menu_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cafe_app/models/coffee.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = [
      "신메뉴",
      "커피",
      "디카페인",
      "Tea",
    ];

    //이미지 슬라이드 아이템
    List<String> bannerItemImgUrl = [
      'images/banner01.jpg',
      'images/banner02.jpg',
    ];

    //커피 메뉴 아이템
    List<String> coffeeMenuImgUrl = [
      'images/coffee01.jpg',
      'images/coffee02.jpg',
      'images/coffee03.jpg',
      'images/coffee04.jpg',
      'images/coffee05.jpg',
      'images/coffee06.jpg',
      'images/coffee01.jpg',
      'images/coffee02.jpg',
      'images/coffee03.jpg',
      'images/coffee04.jpg',
      'images/coffee05.jpg',
      'images/coffee06.jpg',
    ];

    return DefaultTabController(
      initialIndex: 0, //탭바 초기 인덱스
      length: menuItems.length, //탭바 아이템 개수
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '메뉴',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          bottom: TabBar(
            tabs: List.generate(
              menuItems.length,
              (index) => Tab(
                text: menuItems[index],
              ),
            ),
            unselectedLabelColor: Colors.grey, //미선택 라벨 색상
            labelColor: Colors.purple, //선택 라벡 색상
            indicatorColor: Colors.purpleAccent, //인디케이트 바 색상
            indicatorSize: TabBarIndicatorSize.tab, //인디케이트 바 크기 기준
            isScrollable: false, //탭 바 스크롤 여부
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //신메뉴 탭 뷰
            ListView(
              children: [
                //배너
                CarouselSlider.builder(
                  itemCount: bannerItemImgUrl.length,
                  itemBuilder: (context, index, realIndex) {
                    return Stack(
                      children: [
                        Image.asset(
                          bannerItemImgUrl[index],
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    //화면당 이미지 개수 (1개)
                    viewportFraction: 1.0,
                  ),
                ),
                //커피메뉴
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joeun 신메뉴',
                        style: TextStyle(color: Colors.purpleAccent),
                      ),
                      GridView.builder(
                        //스크롤 방지
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true, //큰 이미지의 경우 축소해서 적용합니다.
                        itemCount: coffeeMenuImgUrl.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, //그리드 컬럼 개수 3개
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                coffeeMenuImgUrl[index],
                                fit: BoxFit.cover,
                                width: 40.0,
                                height: 40.0,
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //커피 탭 View
            ListView(
              children: List.generate(
                coffeeList.length,
                (index) => Container(
                  height: 150.0,
                  child: GestureDetector(
                    //클릭 시 상세화면으로 이동
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetailScreen(coffee:coffeeList[index]),));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Row(
                        //이미지, 내용 영역
                        children: [
                          Image.asset(
                            coffeeList[index].imageUrl,
                            fit: BoxFit.cover,
                            width: 100.0,
                            height: 100.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //메뉴 이름, 가격
                                Text(
                                  coffeeList[index].title,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  NumberFormat.decimalPattern().format(int.parse(coffeeList[index].price))+"원",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text('temp2'),
            ),
            Center(
              child: Text('temp3'),
            ),
          ],
        ),
      ),
    );
  }
}
