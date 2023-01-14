import 'package:flutter/material.dart';
import 'package:myfirstproject/Models/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartMode _Cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxConsumer(
            mutations: {RemovMutation},
            builder: (context, _, _CartList) {
              return "\$${_Cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.accentColor)
                  .make();
            }),
        30.widthBox,
        ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: "Buying not supported".text.make()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.cardColor)),
                child: "Buy".text.black.make())
            .w32(context)
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemovMutation]);
    final CartMode _Cart = (VxState.store as MyStore).cart;
    return _Cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _Cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: (() {
                      // _Cart.remove(_Cart.items[index]);
                      RemovMutation(_Cart.items[index]);
                      // setState(() {});
                    }),
                  ),
                  title: _Cart.items[index].name.text.make(),
                )));
  }
}
