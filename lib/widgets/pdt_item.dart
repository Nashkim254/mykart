import 'package:flutter/material.dart';
import 'package:mykart/models/cart_model.dart';
import 'package:mykart/models/product.dart';
import 'package:provider/provider.dart';

class PdtItem extends StatelessWidget {
  final String productName;
  final String image;
  final double price;

  PdtItem({this.productName, this.image, this.price});
  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(('/detail'), arguments: pdt.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: image,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: GridTile(
                        child: Image(
                          image: AssetImage(image),
                        ),
                        footer: GridTileBar(
                          title: Text(productName),
                          trailing: IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  duration: Duration(seconds: 3),
                                  content: Text('Item Added to Cart'),
                                ));
                                cart.addItem(
                                    pdt.id, pdt.productName, pdt.price);
                              }),
                          backgroundColor: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    productName,
                  ),
                  Text(
                    "$price\ksh",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
