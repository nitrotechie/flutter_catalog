import 'package:flutter/material.dart';
import 'package:flutter_catalog/widget/themes.dart';


class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkBluishColor,
          ),
        ),
        Text(
          "Trendig Products",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: MyTheme.darkBluishColor,
          ),
        ),
      ],
    );
  }
}