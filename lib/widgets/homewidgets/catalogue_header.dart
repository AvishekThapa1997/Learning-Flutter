import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes.dart';

class CatalogueHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalogue App",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor),
        ),
        Text(
          "Trending Products",
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}