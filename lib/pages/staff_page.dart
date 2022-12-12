import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_task/controller/staff_controller.dart';
import 'package:simple_task/pages/new_staff_page.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Staff',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
      body: GetBuilder<StaffController>(
        init: StaffController(),
        builder: (controller) => const ListTile(
          title: Text('Staff Name'),
          subtitle: Text('Staff Position'),
        ),
      
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
          onPressed: ()=>Get.to(const NewStaffPage())),
    );
    
  }
}
