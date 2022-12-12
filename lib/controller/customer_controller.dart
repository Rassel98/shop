import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController{
  //customer
  final customerNameController=TextEditingController();
  final customerMobileNumberController=TextEditingController();
  final customerAddressController=TextEditingController();
  final customerPreviousDue=TextEditingController();




  var index=0.obs;
  var customerType='';
  setIndex(var ind) {
    index.value = ind;
  }
  setCustomerType(var type) {
    customerType = type;
    update();
  }

  //sales
  final salesNameController=TextEditingController();
  final salesMobileNumberController=TextEditingController();
  final salesAddressController=TextEditingController();
  final salesPreviousDue=TextEditingController();
 // var salesIndex=0.obs;
  var salesType='';
  // setSalesIndex(var ind) {
  //   salesIndex.value = ind;
  // }
  setSalesType(var type) {
    customerType = type;
    update();
  }
}