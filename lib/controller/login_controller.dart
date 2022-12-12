import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  var isObscure=true;

  setObscure(){
    isObscure=!isObscure;
    update();
  }

}