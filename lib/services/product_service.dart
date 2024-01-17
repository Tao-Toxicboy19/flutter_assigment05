// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductService extends GetxController {
  RxList<String> names = <String>["Pizza", "Banana", "Apple"].obs;
  RxList<String> prices = <String>["199", "20", "30"].obs;

  final nameTextField = TextEditingController();
  final priceTextField = TextEditingController();

  void addProduct() {
    if (nameTextField.text.isNotEmpty) {
      print(nameTextField.text);
      names.add(nameTextField.text);
      nameTextField.clear();
    }
  }

  void addPrice() {
    if (priceTextField.text.isNotEmpty) {
      prices.add(priceTextField.text);
      priceTextField.clear();
    }
  }

  void removeProduct(int id) {
    names.removeAt(id);
    print(id);
  }
}
