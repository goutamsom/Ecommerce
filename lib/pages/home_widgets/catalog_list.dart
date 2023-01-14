// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:myfirstproject/Models/cart.dart';
import 'package:myfirstproject/Widgets/themes.dart';
import 'package:myfirstproject/pages/home_detail_page.dart';

import '../../Models/catalog.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        //CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: catalog),
                )),
            child: CatalogItem(Catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item Catalog;
  CatalogItem({super.key, required this.Catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(Catalog.id.toString()),
          child: CatalogImage(image: Catalog.image),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Catalog.name.text.bold.make(),
            Catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${Catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: Catalog).wh(70, 40)
              ],
            )
          ],
        ))
      ],
    )).white.roundedLg.square(100).make().py16();
  }
}
