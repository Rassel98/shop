import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_task/pages/qr_scanner_page.dart';

import '../controller/product_controller.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: const Text('Add New Products',style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: ()=>Get.to(QRViewExample()), icon: Icon(Icons.qr_code_2,color: Colors.black,)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        physics: BouncingScrollPhysics(),
        child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) {
              return Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Card(
                                child: controller.imageUrl == null
                                    ? controller.isUpload
                                    ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                                    : Image.asset(
                                  'images/gallery.png',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )
                                    : FadeInImage.assetNetwork(
                                  fadeInDuration: const Duration(seconds: 1),
                                  placeholder: 'images/Loading.gif',
                                  image: controller.imageUrl!,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    controller.imageSource = ImageSource.camera;
                                    getImage(controller);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.camera,
                                        color: Colors.purpleAccent,
                                      ),
                                      Text(
                                        'Camera',
                                        style: TextStyle(color: Colors.purpleAccent),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                  onPressed: () {
                                    controller.imageSource = ImageSource.gallery;
                                    getImage(controller);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.photo, color: Colors.purpleAccent),
                                      Text('Gallery',
                                          style:
                                          TextStyle(color: Colors.purpleAccent)),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: controller.productName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        //hintText: "Product Name",
                        labelText: 'Product Name',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: controller.productCode,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                       // hintText: "Product Code",
                        labelText: 'Product Code',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: controller.productBrand,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        //hintText: "Product Name",
                        labelText: 'Brand Name',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),


                  Row(mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: controller.productShade1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              //hintText: "Product Shade1",
                              labelText: 'Shad1',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: controller.shadeQuantity1,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: " Quantity",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ),)

                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: controller.productShade2,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                             // hintText: "Product Shade2",
                              labelText: 'Shade2',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: controller.shadeQuantity2,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: "Quantity",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ),)

                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: controller.productShade3,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              //hintText: "Product Shade3",
                              labelText: 'Shade3',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: controller.shadeQuantity3,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: "Quantity",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ),)

                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: controller.productShade4,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              //hintText: "Product Shade3",
                              labelText: 'Shade4',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: controller.shadeQuantity4,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: "Quantity",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ),)

                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: controller.productShade5,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              //hintText: "Product Shade3",
                              labelText: 'Shade5',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: controller.shadeQuantity5,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: "Quantity",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ),)

                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: controller.productShade6,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              //hintText: "Product Shade3",
                              labelText: 'Shade6',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: controller.shadeQuantity6,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            labelText: "Quantity",
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ),)

                    ],
                  ),
                  const SizedBox(height: 10),

                  Row(mainAxisSize: MainAxisSize.min,
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
                              controller: controller.productPurchasePrice,
                              keyboardType: TextInputType.number,
                              //obscureText: controller.obscureText,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 0),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                //hintText: "Product Purchase Price",
                                labelText: 'Purchase Price',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 14),
                                // suffixIcon: IconButton(
                                //   icon: Icon(controller.obscureText
                                //       ? Icons.remove_red_eye_rounded
                                //       : Icons.remove_red_eye_outlined),
                                //   onPressed: (() => controller.changeObscure()),
                                // ),
                              )),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                            controller: controller.productHoleSalePrice,
                            keyboardType: TextInputType.number,
                            //obscureText: controller.obscureText,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              //hintText: "Product WholeSale Price",
                              labelText: 'WholeSale Price',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14),

                            )),
                      ),)

                    ],
                  ),


                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                        controller: controller.productRetailPrice,
                        keyboardType: TextInputType.number,
                        //obscureText: controller.obscureText,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        //  hintText: "Product Retail Price",
                          labelText: 'Retail Price',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),

                        )),
                  ),
                  const SizedBox(height: 10),

                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: ()async {
                        EasyLoading.show(
                            status: 'Please Wait..', dismissOnTap: false);
                        final status= await controller.addData();
                        if(status){
                          EasyLoading.dismiss();
                          controller.shadeQuantity1.clear();
                          controller.shadeQuantity2.clear();
                          controller.shadeQuantity3.clear();
                          controller.productHoleSalePrice.clear();
                          controller.productRetailPrice.clear();
                          controller.productName.clear();
                          controller.productShade1.clear();
                          controller.productShade2.clear();
                          controller.productShade3.clear();
                          controller.productCode.clear();
                          controller.productPurchasePrice.clear();
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.pink,
                      ),
                      child: Text("Save".toUpperCase()),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.grey.shade500,
                  ),
                ],
              );
            }),
      ),
    );
  }
  void getImage(ProductController controller) async {
    final selectedImage = await ImagePicker().pickImage(source: controller.imageSource);
    if (selectedImage != null) {
      //controller.isUpload = true;
      try {
        //final url =
        // await context.read<ProductProvider>().updateImage(selectedImage);
        // setState(() {
        //   _imageUrl = url;
        //   isUpload = false;
        // });
      } catch (e) {}
    }
  }
}
