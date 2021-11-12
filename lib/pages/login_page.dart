import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {   //validation check mate
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(
          seconds:
              1)); //1 second no wait karse animation mate 1 sec 6 atle pa6i home page uper jatu rese
      await Navigator.pushNamed(context, '/home');
      setState(() {
        changebutton = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          //scroll karva mate best 6 nana phone mate karvu pade column use karo atle
          child: Form(
            //moveToHome method use ui and best program mate pn thay atyre form use kari n batha n ak group ma rakhva mate
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  "assets/images/hey.png",
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be Empty";
                        }

                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be Empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    Material(
                      borderRadius:
                          BorderRadius.circular(changebutton ? 50 : 8),
                      color: Colors.deepPurple,
                      child: InkWell(
                        onTap: () => moveToHome(
                            context), //Single line and Null return kare tyare use thay =>//await mate async use,
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
                        ),
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
          ),
        ));
  }
}
