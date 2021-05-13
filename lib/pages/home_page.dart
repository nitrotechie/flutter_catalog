import 'package:flutter/material.dart';
import 'package:flutter_catalog/widget/drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "NitroTechie";
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('Welcome $days $name'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
