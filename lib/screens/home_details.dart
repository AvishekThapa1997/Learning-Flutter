import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/widgets/themes.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Theme.of(context).canvasColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "\$ ${product.price}",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: width * 0.50,
                height: height * 0.06,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Add To Cart"),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).buttonColor,
                      shape: StadiumBorder()),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Hero(
                child: Image.network(
                  product.image,
                  height: (height * 0.32),
                ),
                tag: Key(product.id.toString()),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.elliptical(300, 50))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Text(
                        product.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        product.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
