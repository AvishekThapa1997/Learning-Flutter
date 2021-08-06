import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: CatalogueModel.items.length,
        itemBuilder: (context, index) =>
            ProductWidget(productItem: CatalogueModel.items[index]),
      ),
      drawer: DrawerMenu(),
    );
  }
}
