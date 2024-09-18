import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/catalog.dart';
import 'package:flutter_catalogue/themes.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogProduct extends StatelessWidget {
  final Product catalog;
  const CatalogProduct({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: Image.asset(
            catalog.img,
          ).box.rounded.p16.make().w40(context),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text
                .color(context.theme.highlightColor)
                .xl2
                .bold
                .make(),
            catalog.desc.text.color(context.theme.highlightColor).make(),
            10.heightBox,
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,
              // buttonPadding: Vx.mOnly(right: 8),
              children: [
                "Rs.${catalog.price}"
                    .text
                    .xl
                    .color(context.theme.highlightColor)
                    .bold
                    .make(),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.CartRoute),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(context.theme.shadowColor),
                    shape: WidgetStatePropertyAll(StadiumBorder()),
                  ),
                  child: "Buy".text.color(Colors.white).bold.make(),
                ),
              ],
            ).pOnly(right: 10)
          ],
        )),
        // Container(
        //   alignment: AlignmentDirectional.bottomStart,
        //   child: catalog.price.text.make(),
        // )
      ],
    )).color(context.theme.cardColor).rounded.square(150).make().py16();
  }
}
