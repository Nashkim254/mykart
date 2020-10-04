import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykart/homePage.dart';
import 'package:mykart/models/orders.dart';
import 'package:mykart/models/product.dart';
import 'package:mykart/models/cart_model.dart';
import 'package:mykart/productPage.dart';
import 'package:mykart/widgets/cart.dart';
import 'package:mykart/widgets/signup.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          // ignore: missing_required_param
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: <String, WidgetBuilder>{
          '/detail': (BuildContext context) => ProductPage(),
          '/cart': (_) => CartScreen(),
          '/login':(_) => Signup(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.mcLarenTextTheme(),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
