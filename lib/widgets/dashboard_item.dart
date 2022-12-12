
import 'package:flutter/material.dart';

import '../model/dashboard_item.dart';

class DashboardItemView extends StatelessWidget {
  final DashboardItem item;
  final Function(String) onPressed;
  const DashboardItemView(
      {Key? key, required this.item, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.deepPurple,
      onTap: () {
        onPressed(item.title);
      },
      child: Ink(

       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius:BorderRadius.circular(15),
         border: Border.all(width: 1,color: Colors.grey.shade600),
         boxShadow:const [
           BoxShadow(
           blurRadius: 10,
           spreadRadius: 8,
             color: Colors.white
         )]
       ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.icon,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
