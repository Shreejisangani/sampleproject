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
    //loading icon jova mate
    // await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); //catalog ma data string ma  avse
    var decodeJson = jsonDecode(
        catalogJson); // anathi data json atle k map ma decode thase and breakpoint thi check kari sako
    var productData = decodeJson["products"]; // product khali iport karva mate

    //PRODUCTDATA LIST MA ave 6 and apde json nu map ma karyu catalog.dart ma mate atyre apde ane list ma convert karvu padse km k apde j pela catalogModel.items use karyu tu aa pn list ma hatu atle

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    //data load karvano 6 farithi kbr padse
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(
    //     20,
    //     (index) => CatalogModel.items[
    //         0]); //Apdi rite generate karva product items[0] atla mate k ayre apdi pas ak j items hati atle

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0 , //shedow nu elevation dur karva mate
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //load nu error ave nahi ana ,mate
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(color: Colors.deepPurple),
                        ),
                        child: Image.network(item.image),
                        footer: Container(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item.price.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ));
                },
              )
            : Center(child: CircularProgressIndicator()),
      ), //builder nu kam items n ak sathe nahi pn jetli screen ma hoy atli and ana karta 2 vadhare item load kare atla mate hoy 6
      drawer: MyDrawer(),
    );
  }
}
