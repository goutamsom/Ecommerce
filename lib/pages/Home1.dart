import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/Models/cart.dart';
import 'package:myfirstproject/Models/catalog.dart';
import 'package:flutter/services.dart';
import 'package:myfirstproject/Widgets/themes.dart';
import 'package:myfirstproject/core/store.dart';
import 'package:myfirstproject/pages/cart_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loaddate();
  }

  loaddate() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedDate = jsonDecode(catalogJson);
    var productsDate = decodedDate["products"];
    CatalogModel.items = List.from(productsDate)
        .map<Item>((item) => Item.formMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemovMutation},
        builder: (context, store, _) => FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ));
                },
                backgroundColor: MyTheme.ColorApp,
                child: Icon(CupertinoIcons.cart))
            .badge(
                color: Vx.red100,
                size: 20,
                count: _cart.items.length,
                textStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
