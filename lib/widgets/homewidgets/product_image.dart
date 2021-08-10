import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Card(
      color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Image.network(
            imageUrl,
            height: 150,
            width: (width * 0.32),
          ),
        ));
  }
}