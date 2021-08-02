import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DrawerMenu extends StatelessWidget {
  final _imageUrl =
      "https://static.wikia.nocookie.net/naruto/images/0/09/Naruto_newshot.png/revision/latest?cb=20210223094656";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Avishek Thapa"),
                  accountEmail: Text("avishekthapa1997@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    radius: 8.0,
                    backgroundImage: NetworkImage(_imageUrl),
                  ),
                )
            ),
            _drawerMenu(CupertinoIcons.home,"Home"),
            _drawerMenu(CupertinoIcons.profile_circled,"Profile"),
            _drawerMenu(CupertinoIcons.mail,"Email Me")
          ],
        ),
      ),
    );
  }
}

Widget _drawerMenu(IconData iconData, String title) {
  return ListTile(
    leading: Icon(
        iconData,
        color: Colors.white
    ),
    title: Text(
      title,
      textScaleFactor: 1.2,
      style: TextStyle(
          color: Colors.white
      ),),
  );
}
