import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
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
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CatalogImage(
                    image: catalog.image,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
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
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      catalog.desc,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.values[1],
                        color: Theme.of(context).accentColor,
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
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        _AddToCart(catalog: catalog)
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

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      child: isAdded ? Icon(Icons.done) : Text("Add to Cart"),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).buttonColor,
          )),
    );
  }
}
