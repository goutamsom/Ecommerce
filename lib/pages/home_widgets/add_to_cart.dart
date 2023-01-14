import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Models/cart.dart';
import '../../Models/catalog.dart';
import '../../Widgets/themes.dart';

class AddToCart extends StatelessWidget {
  late final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemovMutation]);
    final CartMode _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            //isInCart = isInCart.toggle();
            // _cart.catalog = _catalog;
            AddMutation(catalog);
            //_cart.add(catalog);
            //setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(MyTheme.ColorApp.shade600),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            )),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
