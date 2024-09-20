import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_catalogue/core/store.dart';
import 'package:flutter_catalogue/pages/cart_page.dart';
import 'package:flutter_catalogue/pages/detail_page.dart';
import 'package:flutter_catalogue/pages/login_page.dart';
import 'package:flutter_catalogue/themes.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'package:flutter_catalogue/widgets/catalog_product.dart';
import 'package:flutter_catalogue/widgets/home%20widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) =>
            VxState(store: MyStore(), child: MyApp()), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.LightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HomeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        Routes.HomeRoute: (context) => const HomePage(),
        Routes.loginRoute: (context) => const LoginPage(),
        Routes.CartRoute: (context) => const CartPage(),
      },
    );
  }
}
