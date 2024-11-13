

import 'dart:async';

import 'package:cookr/GlobalController.dart';
import 'package:cookr/UI/LoginScreen/LoginScreen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{
  @override
  void onInit() {
    Get.put(GlobalController());
    Timer(const Duration(seconds: 2), (){
      Get.to(const LoginScreen());
      // Get.offNamed(RouteNames.employeeOrCustomer);
      // Get.to(() => EmployeeOrCustomer());
    });
    super.onInit();
  }
}