import 'package:cookr/UI/SplashScreen/SplashScreenController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../UTILS/ImgesPaths.dart';



class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
   final controller=Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Center(
            child: SvgPicture.asset(
              ImagesPaths.logo,
              height: Get.width/3,
              width: Get.width/3,
            )),
      ),
    );
  }
}

