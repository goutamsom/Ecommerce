// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:myfirstproject/pages/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:myfirstproject/Models/catalog.dart';

import '../Widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.transparent,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}".text.bold.xl4.red800.make(),
          AddToCart(
            catalog: catalog,
          ).wh(110, 50)
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              .h32(context)
              .p16(),
          Expanded(
              child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(children: [
                      catalog.name.text.xl4.bold.make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                    ]).py64(),
                  )))
        ]),
      ),
    );
  }
}
