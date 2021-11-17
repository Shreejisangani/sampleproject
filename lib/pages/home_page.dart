import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampleproject/models/catalog.dart';
import 'package:sampleproject/widgets/drawer.dart';
import 'package:sampleproject/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadfile();
  }

  loadfile() async {
    var catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); //catalog ma data string ma  avse
    var decodeJson = jsonDecode(
        catalogJson); // anathi data json atle k map ma decode thase and breakpoint thi check kari sako
    var productData = decodeJson["products"]; // product khali iport karva mate
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(
        20,
        (index) => CatalogModel.items[
            0]); //Apdi rite generate karva product items[0] atla mate k ayre apdi pas ak j items hati atle

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0 , //shedow nu elevation dur karva mate
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length, //items count karse load karva mate
          itemBuilder: (context, index) {
            //most required vastu itemBuilder
            return ItemWidget(
              item: dummyList[index],
            ); //index atle k 0 thi start karva ahiya array jem samjvani
          },
        ),
      ), //builder nu kam items n ak sathe nahi pn jetli screen ma hoy atli and ana karta 2 vadhare item load kare atla mate hoy 6
      drawer: MyDrawer(),
    );
  }
}
