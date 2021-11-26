import 'package:flutter/material.dart';
import 'package:sampleproject/core/store.dart';
import 'package:sampleproject/pages/cart_page.dart';
import 'package:sampleproject/pages/home_page.dart';
import 'package:sampleproject/pages/login_page.dart';
import 'package:sampleproject/utils/routes.dart';
import 'package:sampleproject/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Homepage(), //je page apyu hase aa page load thase route na vapro to
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homepage, // home bydefault hase start ma
      routes: {
        //ghana page hoy ane mate and koi webiste mathi lava mate pn use thay
        "/": (context) => LoginPage(),
        MyRoutes.homepage: (context) => HomePage(),
        MyRoutes.loginpage: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
