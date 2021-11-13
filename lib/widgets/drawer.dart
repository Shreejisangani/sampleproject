import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:
            Colors.deepPurple, //akhi app na drawer ma color change karava mate
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  // decoration: BoxDecoration(color: Colors.black), // only Header vala bhag no color badalva
                  accountName: Text("Shreeji Sangani"),
                  accountEmail: Text("shreejisangani@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage("https://bit.ly/31SOKix"),
                  ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                textScaleFactor: 1.4,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                textScaleFactor: 1.4,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                textScaleFactor: 1.4,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.question,
                color: Colors.white,
              ),
              title: Text(
                "Help",
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                textScaleFactor: 1.4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
