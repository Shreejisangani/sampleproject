import 'package:flutter/material.dart';
import 'package:sampleproject/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          //scroll karva mate best 6 nana phone mate karvu pade column use karo atle
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
                // height: 700.0 , //only for scrolling checkup
              ),
              SizedBox(
                  height:
                      20), //perfect scale apva mate koi vastu n atyre space apva mate
              Text(
                "Welcome",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter username", labelText: "UserName"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password", labelText: "Password"),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home'); //we can also use Myroute.homepage method using MyRoute class
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(
                          minimumSize: Size(150,
                              40)), //android ma ani jarur nathi but ios mate 6 style alag thai jay ana mate
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
