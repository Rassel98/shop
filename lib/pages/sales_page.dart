import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/customer_controller.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:  IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),

        title: const Text('Sales',style: TextStyle(color: Colors.black),),),
      body: GetBuilder<CustomerController>(
          init: CustomerController(),
          builder: (controller) {
            return Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(28),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.salesNameController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          labelText: "Sealer Name",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.salesMobileNumberController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          labelText: "Sealer Phone Number",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.salesAddressController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          labelText: "Sealer Address",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Select Sealer Type'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "Retailer",
                                groupValue: controller.customerType,
                                onChanged: (value) {
                                  controller.setSalesType(value);
                                }),
                            const Text('Retailer'),
                            const SizedBox(
                              width: 64,
                            ),
                            Radio(
                                value: "Dealer",
                                groupValue: controller.customerType,
                                onChanged: (value) {
                                  controller.setSalesType(value);
                                }),
                            const Text('Dealer'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // const Text('Select your Gender'),
                        Row(
                          children: [
                            Radio(
                                value: "Wholesaler",
                                groupValue: controller.customerType,
                                onChanged: (value) {
                                  controller.setSalesType(value);
                                }),
                            const Text('Wholesaler'),
                            const SizedBox(
                              width: 40,
                            ),
                            Radio(
                                value: "Supplier",
                                groupValue: controller.customerType,
                                onChanged: (value) {
                                  controller.setSalesType(value);
                                }),
                            const Text('Supplier'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.salesPreviousDue,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          labelText: "Previous Due",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          // EasyLoading.show(
                          //     status: 'Please Wait..', dismissOnTap: false);
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.pink,
                        ),
                        child: Text("Save".toUpperCase()),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Divider(
                    //   color: Colors.grey.shade500,
                    // ),
                  ],
                ),
              ),
            );
          }),
    );

  }
}
