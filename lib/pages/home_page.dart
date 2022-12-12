
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simple_task/pages/products_page.dart';
import 'package:simple_task/pages/report_page.dart';
import 'package:simple_task/pages/stock_page.dart';
import '../model/dashboard_item.dart';
import '../widgets/dashboard_item.dart';
import 'customer_page.dart';
import 'expense_page.dart';

import 'sales_page.dart';

import 'staff_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        //backgroundColor: Colors.black54,
        appBar: AppBar(
          elevation: 0,
          leading: const CircleAvatar(
            backgroundImage: AssetImage('images/profile.jpg'),
          ),
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Styling',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Shop name',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // AuthService.logout();
                },
                icon: const Icon(
                  Icons.notifications_active,
                  color: Colors.blue,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
              itemCount: dashboardItems.length,
              itemBuilder: (context, index) => DashboardItemView(
                  item: dashboardItems[index],
                  onPressed: (value) {
                    navigate(context, value);
                    // final route=navigate( value);
                    // Navigator.pushNamed(context, route);
                  })),
        ),

     );
  }

  void navigate(BuildContext context, String value) {
    //Return Sting
    //String route='';
    switch (value) {
      case DashboardItem.product:
        Get.to(const ProductsPage());
        break;
      case DashboardItem.customer:
        Get.to(const CustomerPage());

        break;
      case DashboardItem.sales:
        Get.to(const SalesPage());
        break;
      case DashboardItem.staff:
        Get.to(const StaffPage());
        break;
      case DashboardItem.expense:
        Get.to(const ExpensePage());

        break;
      case DashboardItem.report:
        Get.to(const ProductReport());
        break;
      case DashboardItem.suppliers:
        break;
      case DashboardItem.duList:

        break;
      case DashboardItem.stock:
        Get.to(const StockPage());
        break;
    }
  }
}
