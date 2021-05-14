import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widget/themes.dart';

import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
          height: 125,
          width: 125,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: CatalogImage(
                  image: catalog.image,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      catalog.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      catalog.desc,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.values[1],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${catalog.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Add to Cart"),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(StadiumBorder()),
                              backgroundColor: MaterialStateProperty.all(
                                MyTheme.darkBluishColor,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
