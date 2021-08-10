import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/screens/home_details.dart';
import 'package:flutter_app/widgets/homewidgets/product_image.dart';

import '../themes.dart';

class CatalogueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int? itemCount = CatalogueModel.items!.length;
    // TODO: implement build
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final product = CatalogueModel.items![index];
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetails(product: product)));
              },
              child: CatalogueItem(product: product));
        },
        itemCount: itemCount != null ? itemCount : 0);
  }
}

class CatalogueItem extends StatelessWidget {
  final Product product;

  const CatalogueItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    print(product.image);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
      ),
      height: (height / 4),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Hero(
              child: ProductImage(imageUrl: product.image),
              tag : Key(product.id.toString())
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text(
                  product.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    Text(
                      "\$ ${product.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Add To Cart",style: TextStyle(
                        fontSize: 16
                      ),),
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).buttonColor,
                          shape: StadiumBorder()),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
