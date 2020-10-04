import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mykart/models/cart_model.dart';
import 'package:mykart/models/product.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
        loadedPdt.productName,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
      ),
     
      
     
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: loadedPdt.image,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                    image: AssetImage(loadedPdt.image),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  loadedPdt.productName,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: Text(
                  "${loadedPdt.price}\Ksh",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Expanded(
                      child: OutlineButton.icon(
                        icon: Icon(EvaIcons.shoppingBagOutline),
                        label: Text("Add Cart"),
                        onPressed: (){
                          cart.addItem(productId,loadedPdt.productName,loadedPdt.price);
                        },
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: RaisedButton.icon(
                        textColor: Colors.black,
                        color: Colors.amber,
                        icon: Icon(EvaIcons.creditCard),
                        label: Text("Buy Now"),
                        onPressed: (){},
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: Text(
                  loadedPdt.description,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
 
         ),
        ),
      ),
    );
  }
}

