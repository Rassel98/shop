import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_task/pages/new_product_page.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product',style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: ListView.builder(

        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12),
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          title: Text('Product Name'),
          subtitle: Text('Stock:23'),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: ()=>Get.to(const NewProductPage())),
    );
  }
}
