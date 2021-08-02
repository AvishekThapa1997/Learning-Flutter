

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/drawer.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Catalog App")
        ),
        body: Center(
          child: Container(
            child: Text("Flutter Day-1"),
          ),
        ),
        drawer: DrawerMenu(),
      );
  }

}