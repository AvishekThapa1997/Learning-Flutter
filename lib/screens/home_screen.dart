import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:flutter_app/widgets/homewidgets/catalogue_header.dart';
import 'package:flutter_app/widgets/homewidgets/catalogue_list.dart';
import 'package:flutter_app/widgets/themes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: Text("Catalog App")),
    //   body: (CatalogueModel.items != null && CatalogueModel.items!.isNotEmpty)
    //       ? GridView.builder(
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //           ),
    //           itemCount: CatalogueModel.items!.length,
    //           itemBuilder: (context, index) {
    //             final product = CatalogueModel.items![index];
    //             return Card(
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10)),
    //               child: Container(
    //                 child: GridTile(
    //                   child: Image.network(product.image!),
    //                   header: Container(
    //                     child: Text(
    //                       product.title!,
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                     decoration: BoxDecoration(color: Colors.deepPurple),
    //                     padding: const EdgeInsets.all(12),
    //                   ),
    //                   footer: Container(
    //                       child: Text("${product.price!}",
    //                           style: TextStyle(color: Colors.white)),
    //                       decoration: BoxDecoration(color: Colors.black),
    //                       padding: const EdgeInsets.all(12)),
    //                 ),
    //               ),
    //             );
    //           })
    //       : Center(
    //           child: CircularProgressIndicator(color: Colors.deepPurple),
    //         ),
    //   drawer: DrawerMenu(),
    // );
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoute.cartRoute),
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).buttonColor,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogueHeader(),
              if (CatalogueModel.items != null &&
                  CatalogueModel.items!.isNotEmpty)
                Expanded(child: CatalogueList())
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  // ListView.builder(
  // padding: EdgeInsets.all(16),
  // itemCount: CatalogueModel.items!.length,
  // itemBuilder: (context, index) =>
  // ProductWidget(productItem: CatalogueModel.items![index]),
  // )
  void loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var res = await rootBundle.loadString("assets/files/catalogue.json");
    var decodeRes = jsonDecode(res);
    List<Product> products = List.from(decodeRes)
        .map<Product>((item) => Product.fromJson(item))
        .toList();
    CatalogueModel.items = products;
    setState(() {});
  }
}
