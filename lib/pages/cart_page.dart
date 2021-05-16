import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: Text("Cart"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _CartList(),
            ),
          ),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatefulWidget {
  @override
  __CartTotalState createState() => __CartTotalState();
}

class __CartTotalState extends State<_CartTotal> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Total :  \$${_cart.totalPrice}",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 100,
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Buying not supported yet.")));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Buy Now",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder()),
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).buttonColor,
                )),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(CupertinoIcons.delete),
          onPressed: () {},
        ),
        title: Text(
          _cart.items[index].name,
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
