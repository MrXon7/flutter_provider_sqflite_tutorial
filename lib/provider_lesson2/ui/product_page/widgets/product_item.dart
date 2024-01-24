import 'package:flutter/material.dart';
import 'package:project1/provider_lesson2/data/models/product_model/product_model.dart';
import 'package:project1/provider_lesson2/ui/description/description_page.dart';

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  ProductModel product;
  ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionPage(product: product,),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: ListTile(
          title: Text(product.title),
          subtitle: Image.network(
            product.image,
            height: 60,
          ),
        ),
      ),
    );
  }
}
