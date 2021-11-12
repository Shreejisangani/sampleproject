import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

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
                "Welcome $name",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter username", labelText: "UserName"),
                    onChanged: (value) {
                      name = value;
                      setState(
                          () {}); //stateful ma farithi call karva mate build method n
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter password", labelText: "Password"),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),

                  InkWell(
                    onTap: () async //await mate use
                        {
                      setState(() {
                        changebutton = true;
                      });
                      await Future.delayed(Duration(seconds: 1)); //1 second no wait karse animation mate 1 sec 6 atle pa6i home page uper jatu rese
                      Navigator.pushNamed(context, '/home');
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changebutton ? 50 : 150.0,
                      height: 50.0,
                      alignment: Alignment.center,
                      child: changebutton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          // shape: changebutton? BoxShape.circle : BoxShape.rectangle,
                          borderRadius:
                              BorderRadius.circular(changebutton ? 50 : 8)),
                    ),
                  ),
                  // ElevatedButton(       //button mate j 6 pn animated mate container use karvanu 6
                  //   onPressed: () {
                  //     Navigator.pushNamed(context,
                  //         '/home'); //we can also use Myroute.homepage method using MyRoute class
                  //   },
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(
                  //       minimumSize: Size(150,
                  //           40)), //android ma ani jarur nathi but ios mate 6 style alag thai jay ana mate
                  // )
                ]),
              )
            ],
          ),
        ));
  }
}
