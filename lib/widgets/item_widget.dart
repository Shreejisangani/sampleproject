import 'package:flutter/material.dart';
import 'package:sampleproject/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item; //catalog.dart no 6 class Item and ano variable item
  const ItemWidget({Key? key, required this.item})
      : super(
            key:
                key); // assert item null nathi n aa check karva and required atle ana vagar nahi chale

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0.0, //if you wish
      child: ListTile(
        onTap: () {
          print("${item.name} Pressed");
        },
        leading: Image.network(
          item.image,
        ),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
          textScaleFactor: 1.4,
        ),
      ),
    );
  }
}
