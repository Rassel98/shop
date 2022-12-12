import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/customer_controller.dart';
import 'home_page.dart';
import 'sales_page.dart';
import 'settings_page.dart';
import 'staff_page.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomerController());
    List<Widget> pge = [
      const HomePage(),
      const SalesPage(),
      const StaffPage(),
      const SettingsPage()
    ];
    return Scaffold(
        body: Obx(() => pge[controller.index.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',

                // backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                label: 'sales',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                label: 'Staff',
                //backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: 'Settings',
                // backgroundColor: Colors.pink,
              ),
            ],
            currentIndex: controller.index.value,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              controller.setIndex(index);
            },
          ),
        ));
  }
}
