import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardItem{
  IconData icon;
  String title;

  DashboardItem({required this.icon, required this.title});

  static const String product = 'Product';
  static const String customer = 'Customer';
  static const String staff = 'Staff';
  static const String sales = 'Sales';
  static const String expense = 'Expense';
  static const String report = 'Report';
  static const String suppliers = 'Suppliers';
  static const String duList = 'DueList';
  static const String stock = 'Stock';
}
// final List<DashboardItem>das=[
//   DashboardItem(icon: Icons.ac_unit, title: DashboardItem.product)
// ];

final List<DashboardItem> dashboardItems = [
  DashboardItem(icon: Icons.card_giftcard, title: DashboardItem.product),
  DashboardItem(icon: Icons.people, title: DashboardItem.customer),
  DashboardItem(icon: FontAwesomeIcons.personCane, title: DashboardItem.staff),
  DashboardItem(icon: FontAwesomeIcons.truck, title: DashboardItem.sales),
  DashboardItem(icon: FontAwesomeIcons.handshake, title: DashboardItem.expense),
  DashboardItem(icon: Icons.supervised_user_circle_outlined, title: DashboardItem.suppliers),
  DashboardItem(icon: Icons.area_chart, title: DashboardItem.report),
  DashboardItem(icon: FontAwesomeIcons.fileInvoiceDollar, title: DashboardItem.duList),
  DashboardItem(icon: FontAwesomeIcons.chartArea, title: DashboardItem.stock),
];