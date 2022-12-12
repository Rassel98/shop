import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffController extends GetxController{
  List<String>paymentList=['Cash','Bank','Check'];
  final staffName = TextEditingController();
  final staffEmail = TextEditingController();
  final staffMobile = TextEditingController();
  final staffId = TextEditingController();
  final staffSalary = TextEditingController();
  final staffRole = TextEditingController();
  final staffComition= TextEditingController();
  final staffPassword= TextEditingController();

  final expenseType= TextEditingController();
  final expenseAmount= TextEditingController();

  var isLogin = true, isObscureText = true;

 String? category;
  DateTime? purchaseDate;
  final formKey = GlobalKey<FormState>();
 // String errMsg = '';
setObsicure(){
  isObscureText=!isObscureText;
  update();
}
  setCategory( String cat){
    category=cat;
    update();
  }
  setSelectedDate(DateTime selectDate){
  purchaseDate=selectDate;
  update();
  }
  // void selectedDate() async {
  //   final selectedDate = await showDatePicker(
  //       context: ,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(1950),
  //       lastDate: DateTime.now());
  //
  //   if (selectedDate != null) {
  //     // setState(() {
  //     //   _purchaseDate = selectedDate;
  //     // });
  //   }
 // }


}