import 'package:flutter/material.dart';
import 'package:project1/provider_lesson2/data/models/product_model/product_model.dart';

// ignore: must_be_immutable
class DescriptionPage extends StatelessWidget {
  ProductModel product;
  DescriptionPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Description Page")),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.network(
                product.image,
                height: 100,
              ),
              Text(product.title),
            ],
          ),
        ),
      ),
    );
  }
}
