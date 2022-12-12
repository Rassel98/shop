import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_task/controller/staff_controller.dart';

import '../utils/helper_functions.dart';

class NewStaffPage extends StatelessWidget {
  const NewStaffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      //backgroundColor:const Color(0xfff637ec),
      body: GetBuilder<StaffController>(init: StaffController(),
        builder: (controller) => Center(
          child: Form(
            key: controller.formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              children: [


                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(

                    textInputAction: TextInputAction.next,
                    controller: controller.staffId,
                    keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        labelText: 'Staff ID',
                        prefixIcon: const Icon(Icons.perm_identity),
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),

                      ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: controller.staffName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none),
                      labelText: 'Staff Name',
                      prefixIcon: Icon(Icons.person),
                      hintStyle: TextStyle(
                          color: Colors.grey.shade600, fontSize: 14),

                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: controller.staffEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none),
                      labelText: 'Staff Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintStyle: TextStyle(
                          color: Colors.grey.shade600, fontSize: 14),

                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(

                    textInputAction: TextInputAction.next,
                    controller: controller.staffMobile,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none),
                      labelText: 'Staff Mobile Number',
                      prefixIcon: Icon(Icons.phone),
                      // hintStyle: TextStyle(
                      //     color: Colors.grey.shade600, fontSize: 14),

                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(

                    textInputAction: TextInputAction.next,
                    controller: controller.staffRole,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none),
                      labelText: 'Staff role',
                      prefixIcon: Icon(Icons.roller_skating_outlined),
                      // hintStyle: TextStyle(
                      //     color: Colors.grey.shade600, fontSize: 14),

                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  padding: const EdgeInsets.only(left: 10),
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
                      TextButton(
                          onPressed: () {
                            selectedDate(context, controller);
                          },
                          child: const Text('Select join Date')),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    obscureText: controller.isObscureText,
                    textInputAction: TextInputAction.done,
                    controller: controller.staffPassword,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none),
                      labelText: 'Password',

                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(controller.isObscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          controller.setObsicure();
                        }
                      ),

                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      authenticate(controller);

                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.pink,
                    ),
                    child: Text("Save".toUpperCase()),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   'errMsg',
                //   style: TextStyle(color: Theme.of(context).errorColor),
                // )
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

  authenticate(StaffController controller) async {
    if(controller.formKey.currentState!.validate()){

    }
    // if (formKey.currentState!.validate()) {
    //   try {
    //     final status =
    //     await AuthService.register(emailController.text, passController.text);
    //     if (status) {
    //       if(!mounted){
    //         return;
    //       }
    //       EasyLoading.show(status: 'Please Wait',dismissOnTap: false);
    //       final userModel=UserModel(
    //           uid: AuthService.user!.uid,
    //           name: nameController.text,
    //           email: AuthService.user!.email!,
    //           mobile: phoneController.text,
    //           userCreationTime: Timestamp.fromDate(AuthService.user!.metadata.creationTime!)
    //       );
    //       Provider.of<UserProvider>(context,listen: false).addUser(userModel)
    //           .then((value) {
    //         EasyLoading.dismiss();
    //         Navigator.pushNamedAndRemoveUntil(context, LauncherPage.routeName, (route) => false);
    //       });
    //     } else {
    //       AuthService.logout();
    //       setState(() {
    //         errMsg = 'Your information is in correct';
    //       });
    //     }
    //   } on FirebaseAuthException catch (e) {
    //     setState(() {
    //       errMsg = e.message!;
    //     });
    //   }
    // }
  }
}
