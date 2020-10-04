import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String productName;
  final String image;
  final double price;
  final String description;

  Product(
      {@required this.id,
      @required this.description,
      @required this.image,
      @required this.price,
      @required this.productName});
}

class Products with ChangeNotifier {
  List<Product> products = [
    Product(
      id: '1',
      image: "assets/product1.jpg",
      description:
          'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
      price: 100,
      productName: "iPad mini",
    ),
    Product(
        id: '2',
        image: "assets/product2.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "iPad Pro"),
    Product(
        id: '3',
        image: "assets/product3.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "iPhone Pro Max"),
    Product(
        id: '4',
        image: "assets/product4.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "Apple Watch Series 3"),
    Product(
        id: '5',
        image: "assets/product5.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "Apple Watch Series 4"),
    Product(
        id: '6',
        image: "assets/product6.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "Macbook Pro 16 inch"),
    Product(
        id: '7',
        image: "assets/product7.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "Macbook Pro"),
    Product(
        id: '8',
        image: "assets/product8.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "iMac 4k Retina"),
    Product(
        id: '9',
        image: "assets/product9.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "T-Shirts"),
    Product(
        id: '10',
        image: "assets/product10.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "Ethnic Wear - Dress"),
    Product(
        id: '11',
        image: "assets/product11.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "Dress"),
    Product(
        id: '12',
        image: "assets/product12.jpg",
        description:
            'Mykart is an online presence mobile app that lets its users access quality products and which stores offers the same products. Also SalesPersons can register with the app to post products.',
        price: 100,
        productName: "T-Shirt"),
  ];
  List<Product> get items {
    return [...products];
  }

  Product findById(String id) {
    return products.firstWhere((pdt) => pdt.id == id);
  }
}
