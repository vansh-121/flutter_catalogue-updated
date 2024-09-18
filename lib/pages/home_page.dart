// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'package:flutter_catalogue/widgets/home%20widgets/catalog_header.dart';
import 'package:flutter_catalogue/widgets/home%20widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalogue/models/catalog.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final json = await rootBundle.loadString("assets/files/catalog.json");
    final decodedjson = jsonDecode(json);
    var productsdata = decodedjson["products"];
    CatalogModel.products = List.from(productsdata)
        .map<Product>(
          (product) => Product.fromMap(product),
        )
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.CartRoute),
        shape: StadiumBorder(),
        backgroundColor: context.theme.shadowColor,
        child: const Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: context.theme.canvasColor,
        title: Text(
          "FlipTronics",
          style: TextStyle(
              color: context.theme.highlightColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Container(
          // color: MyTheme.creamcolor,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              if (CatalogModel.products != null &&
                  CatalogModel.products.isNotEmpty)
                Expanded(
                  child: CatalogList().py8(),
                )
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
      // backgroundColor: Colors.black,
    );
  }
}
