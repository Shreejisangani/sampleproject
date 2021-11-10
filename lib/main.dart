import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleproject/pages/home_page.dart';
import 'package:sampleproject/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Homepage(), //je page apyu hase aa page load thase route na vapro to
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily),//googlefontimport
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark
      // ),
      initialRoute: "/", // home bydefault hase start ma
      routes: {
        //ghana page hoy ane mate and koi webiste mathi lava mate pn use thay
        "/": (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage()
      },
    );
  }
}
