class Coffee {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final String imageUrl2;

  Coffee({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.imageUrl2,
  });

}
  //샘플 데이터
  List<Coffee> coffeeList = [
    Coffee(
      id: "01",
      title: "아메리카노",
      price: "3500",
      imageUrl: "images/coffee04.jpg",
      imageUrl2: "images/coffee05.jpg",
    ),
    Coffee(
      id: "02",
      title: "카페라떼",
      price: "4500",
      imageUrl: "images/coffee01.jpg",
      imageUrl2: "images/coffee02.jpg",
    ),
    Coffee(
      id: "03",
      title: "리스트레토라떼",
      price: "6500",
      imageUrl: "images/coffee03.jpg",
      imageUrl2: "images/coffee06.jpg",
    ),
    Coffee(
      id: "04",
      title: "시그니처 필터",
      price: "7500",
      imageUrl: "images/coffee01.jpg",
      imageUrl2: "images/coffee05.jpg",
    ),
    Coffee(
      id: "05",
      title: "커피처럼 보이지만 스무디",
      price: "8500",
      imageUrl: "images/coffee02.jpg",
      imageUrl2: "images/coffee06.jpg",
    ),
  ];
