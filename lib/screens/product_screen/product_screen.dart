// ignore_for_file: unnecessary_string_interpolations, sized_box_for_whitespace, prefer_const_constructors, depend_on_referenced_packages, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_assigment05/services/product_service.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductService productService = Get.put(ProductService());
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    final FocusNode productNameFocus = FocusNode();
    final FocusNode priceFocus = FocusNode();

    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: TextField(
                  focusNode: productNameFocus,
                  controller: productService.nameTextField,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product',
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: TextField(
                  focusNode: priceFocus,
                  controller: productService.priceTextField,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                  ),
                ),
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  productService.addProduct();
                  productService.addPrice();
                  // หาย Focus จาก TextField
                  productNameFocus.unfocus();
                  priceFocus.unfocus();
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Obx(
                  () => ListView.builder(
                    itemCount: productService.names.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: (index % 2 == 0)
                            ? Colors.amber.shade500
                            : Colors.amber.shade100,
                        child: ListTile(
                          title: Text("${productService.names[index]}"),
                          subtitle: Text("${productService.prices[index]}"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                productService.removeProduct(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
