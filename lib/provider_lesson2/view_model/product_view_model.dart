import 'package:flutter/material.dart';
import 'package:project1/provider_lesson2/service/api_service/api_service.dart';

class ProductViewModel extends ChangeNotifier {
  List products = [];
  bool isLoading = false;

  void getAllProduct() async {
    changeLoadingState();
    products = await ApiService().getAllProducts();
    changeLoadingState();
    notifyListeners();
  }

  void changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
