import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_task/controller/login_controller.dart';
import 'package:simple_task/pages/home_page.dart';

import 'navigator_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SafeArea(
  child: GetBuilder<LoginController>(
      init: LoginController(),
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
                    controller: controller.emailController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none),
                      labelText: "Email",
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
                    obscureText: controller.isObscure,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none),
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                         controller.isObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xFFFF4891),
                        ),
                        onPressed: () => controller.setObscure(),
                      ),

                      hintStyle: TextStyle(
                          color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () =>Get.offAll(const NavigatorPage()),
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
),
    );
  }
}
