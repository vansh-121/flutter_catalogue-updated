import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/cart.dart';
import 'package:flutter_catalogue/pages/detail_page.dart';
import 'package:flutter_catalogue/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.cardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "My Cart".text.bold.make(),
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Coming Soon".text.xl.color(Colors.white).make(),
                backgroundColor: context.theme.shadowColor,
              ));
            },
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(context.theme.shadowColor),
            ),
            child: "Place Order".text.color(Colors.white).bold.make(),
          ).wh(140, 35),
          30.widthBox,
          "Rs.${_cart.totalPrice}"
              .text
              .color(context.theme.hintColor)
              .bold
              .xl4
              .make()
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.products.isEmpty
        ? "Cart is Empty !".text.makeCentered()
        : ListView.builder(
            itemCount: _cart.products?.length,
            itemBuilder: (context, index) => ListTile(
                  title: _cart.products[index].name.text.make().px32(),
                  trailing: IconButton(
                      onPressed: () {
                        _cart.remove(_cart.products[index]);
                        setState(() {});
                      },
                      icon: const Icon(CupertinoIcons.delete)),
                  leading: Icon(Icons.done),
                ));
  }
}
