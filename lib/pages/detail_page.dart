// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/cart.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalogue/models/catalog.dart';

class DetailPage extends StatelessWidget {
  final Product catalog;
  const DetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          // buttonPadding: Vx.mOnly(right: 8),
          children: [
            catalog.price.text.xl3
                .color(context.theme.hintColor)
                .extraBold
                .make(),
            _AddToCart(catalog: catalog),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.asset(catalog.img))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.theme.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold.make().py8(),
                      catalog.desc.text.xl.make(),
                      10.heightBox,
                      "For further information regarding this product, please visit our official website. For inquiries related to the shipment process, kindly contact us at customer.care@fliptronics.com."
                          .text
                          .make()
                          .p16()
                    ],
                  ).p32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddToCart extends StatefulWidget {
  final Product catalog;

  const _AddToCart({super.key, required this.catalog});

  @override
  State<_AddToCart> createState() => __AddToCartState();
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
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(context.theme.shadowColor),
        shape: const WidgetStatePropertyAll(StadiumBorder()),
      ),
      child: isAdded
          ? Icon(Icons.done)
          : "Add To Cart".text.color(Colors.white).bold.make(),
    ).wh(140, 40);
  }
}
