import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampleproject/models/catalog.dart';
import 'package:sampleproject/widgets/home_widgets/catalog_header.dart';
import 'package:sampleproject/widgets/home_widgets/catalog_list.dart';
import 'package:sampleproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';



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
    await Future.delayed(Duration(seconds: 2));
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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
          child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
            else
              CircularProgressIndicator().centered().expand()
          ],
        ),
      )),
    );
  }
}