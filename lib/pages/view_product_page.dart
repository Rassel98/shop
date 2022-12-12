import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_task/controller/product_controller.dart';

class ViewProductsPage extends StatelessWidget {
  const ViewProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pcontroller = Get.put(ProductController());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                        controller: pcontroller.searchController,
                        keyboardType: TextInputType.text,
                        //obscureText: controller.obscureText,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Icon(Icons.search),
                          hintText: "search",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        )),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      pcontroller.searchProduct();
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          ),
          GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => controller.productModel == null
                ? ListView.builder(
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.allProducts.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(controller.allProducts[index].productName),
                      subtitle: Text('Stock: ${controller.allProducts[index].stock}'),
                    ),
                  )
                : ListTile(
                    title: Text(controller.productModel!.productName),
              subtitle: Text('Stock: ${controller.productModel!.stock}'),
                  ),
          ),
        ],
      )),
    );
  }
}
