import 'package:flutter/material.dart';
import 'package:project1/provider_lesson2/ui/product_page/widgets/product_item.dart';
import 'package:project1/provider_lesson2/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var myProvider = context.read<ProductViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: Consumer<ProductViewModel>(builder: (context, myProvider, child) {
        if (myProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (myProvider.products.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: myProvider.products.length,
            itemBuilder: (context, index) => ProductItem(
              product: myProvider.products[index],
            ),
          );
        } else {
          return Text("data yoq");
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductViewModel>().getAllProduct();
        },
      ),
    );
  }
}
