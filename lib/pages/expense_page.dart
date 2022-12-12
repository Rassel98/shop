import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_task/controller/staff_controller.dart';

import '../utils/helper_functions.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Expense',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<StaffController>(
            init: StaffController(),
            builder: (controller) => Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Column(crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    const Text('Date'),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.purchaseDate == null
                              ? 'No Date Selected'
                              : getFormattedDateTime(
                                  controller.purchaseDate!, 'dd/MM/yyy')),
                          IconButton(
                              onPressed: () {
                                selectedDate(context, controller);
                              },
                              icon: const Icon(Icons.calendar_month,color: Colors.blue,)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Payment Mode'),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField(

                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        hint: const Text('Select'),
                        items: controller.paymentList
                            .map((method) => DropdownMenuItem<String>(
                                value: method, child: Text(method)))
                            .toList(),
                        value: controller.category,

                        onChanged: (value) {
                          controller.setCategory(value!);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field must not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),

                // Container(
                //   height: 55,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: TextField(
                //       controller: controller.expenseType,
                //       keyboardType: TextInputType.text,
                //       textInputAction: TextInputAction.next,
                //       //obscureText: controller.obscureText,
                //       decoration: InputDecoration(
                //         contentPadding: const EdgeInsets.symmetric(
                //             horizontal: 8, vertical: 0),
                //         border: const OutlineInputBorder(
                //             borderSide: BorderSide.none),
                //         hintText: "Expense Type",
                //         hintStyle: TextStyle(
                //             color: Colors.grey.shade600, fontSize: 14),
                //
                //       )),
                // ),
                const SizedBox(height: 15),

                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                      controller: controller.expenseAmount,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      //obscureText: controller.obscureText,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        labelText: "Expense Amount",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      )),
                ),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (controller.expenseType.text.isEmpty ||
                          controller.expenseAmount.text.isEmpty) {
                        Get.snackbar(
                            duration: const Duration(seconds: 3),
                            snackPosition: SnackPosition.BOTTOM,
                            'Expense',
                            'Expense type or amount not empty');
                      }
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.pink,
                    ),
                    child: Text("Save".toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectedDate(BuildContext context, StaffController controller) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());

    if (selectedDate != null) {
      controller.setSelectedDate(selectedDate);
      // setState(() {
      //   _purchaseDate = selectedDate;
      // });
    }
  }
}
