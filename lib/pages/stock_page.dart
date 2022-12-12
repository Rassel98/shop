import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockPage extends StatelessWidget {
  const StockPage({Key? key}) : super(key: key);

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
        title: const Text('Stock List',style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
               // SizedBox(width: 20,),
                Text('Stock',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
               // SizedBox(width: 20,),
                Text('Purchase',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                //SizedBox(width: 20,),
                Text('WholeSale',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                //SizedBox(width: 20,),
                Text('Sale',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
              ],
            ),
            const Divider(height: 2,color: Colors.black,),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Name'),
                    Text('Stock'),
                    Text('Purchase'),
                    Text('WholeSale'),
                    Text('Sale'),
                  ],
              ),
                ),),
            )
          ],
        ),
      ),
    );
  }
}
