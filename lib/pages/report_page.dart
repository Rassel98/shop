import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReport extends StatelessWidget {
  const ProductReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text(
          'Product Report',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Text('Getx Alerd'),
        ),
      ),
    );
  }
}
