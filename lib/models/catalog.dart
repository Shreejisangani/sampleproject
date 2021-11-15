import 'package:flutter/cupertino.dart';

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}

final products = [
  Item(
      id: "shreeji001",
      name: "iPhone 12 pro",
      desc: "Apple iPhone 12th generation",
      price: 999,
      color: "#33505a",
      image: "https://www.fonewalls.com/wp-content/uploads/2020/10/Apple-iPhone-12-Pro-Max.jpg"
      )
];
