import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:
            context.theme.canvasColor, //akhi app na drawer ma color change karava mate
        child: ListView(
          children: [
            DrawerHeader(
                
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: context.canvasColor), // only Header vala bhag no color badalva
                  accountName: Text("Shreeji Sangani",style: TextStyle(color: context.accentColor),),
                  accountEmail: Text("shreejisangani@gmail.com",style: TextStyle(color: context.accentColor)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage("https://bit.ly/31SOKix"),
                  ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: context.accentColor,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: context.accentColor,fontWeight: FontWeight.bold),
                textScaleFactor: 1.4,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: context.accentColor,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: context.accentColor,fontWeight: FontWeight.bold),
                textScaleFactor: 1.4,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: context.accentColor,
              ),
              title: Text(
                "Email me",
                style: TextStyle(color: context.accentColor,fontWeight: FontWeight.bold),
                textScaleFactor: 1.4,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.question,
                color: context.accentColor,
              ),
              title: Text(
                "Help",
                style: TextStyle(color: context.accentColor,fontWeight: FontWeight.bold),
                textScaleFactor: 1.4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
