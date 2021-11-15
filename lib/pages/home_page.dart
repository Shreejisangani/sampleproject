import 'package:flutter/material.dart';
import 'package:sampleproject/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0 , //shedow nu elevation dur karva mate
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to My catalog App'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
