import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/widgets/themes.dart';

class ProductWidget extends StatelessWidget {
  final Product productItem;

  const ProductWidget({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build;
    return Card(
      child: ListTile(
        leading: Image.network(productItem.image),
        minLeadingWidth: 100,
        title: Text(productItem.title),
        subtitle: Text(productItem.description),
        trailing: Text(
          "\$ ${productItem.price.toString()}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => {},
      ),
    );
  }
}


