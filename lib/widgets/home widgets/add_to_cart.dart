import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/cart.dart';
import 'package:flutter_catalogue/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Product catalog;

  const AddToCart({super.key, required this.catalog});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.products.contains(widget.catalog) ?? false;
    return ElevatedButton(
            onPressed: () {
              if (!isAdded) {
                isAdded = isAdded.toggle();
                final _catalog = CatalogModel();
                _cart.catalog = _catalog;
                _cart.add(widget.catalog);
                setState(() {});
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(context.theme.shadowColor),
              shape: const WidgetStatePropertyAll(StadiumBorder()),
            ),
            child: isAdded
                ? const Icon(
                    Icons.done,
                    color: Colors.white,
                  )
                : Icon(
                    CupertinoIcons.cart_badge_plus,
                    color: Colors.white,
                  ))
        .wh(70, 40);
  }
}
