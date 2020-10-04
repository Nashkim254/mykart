

import 'package:flutter/material.dart';
import 'package:mykart/models/product.dart';
import 'package:provider/provider.dart';
import './pdt_item.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<Products>(context);
    final pdts=productData.items;
    return GridView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: pdts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.4),
      itemBuilder: (ctx, i)=>ChangeNotifierProvider.value(value: pdts[i],
      child: PdtItem(productName: pdts[i].productName,image: pdts[i].image,price:pdts[i].price)),
    );
  }
}