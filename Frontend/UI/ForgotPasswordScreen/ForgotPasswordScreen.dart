import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/Routs/RoutsNames.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
              // Get.offNamedUntil(RouteNames.homeMainScreen, (route) => false);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            )),
        title: Text(
          "Forgot password",
          style: CustomTextStyles.size18w500W,
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Divider(
              color: MyColors.greyColor3,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Center(child: SizedBox(height: 20)),
                Lottie.asset(
                  'assets/lottie/3.json',
                  // repeat:false,
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: Get.height * 0.2),

                // Description text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select verification method and we will send verification code',
                    style: CustomTextStyles.size14w500W,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 20),

                // Email selection box
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: MyColors.greyColor3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: MyColors.mainColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.email, color: Colors.white),
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '********@mail.com',
                          style: CustomTextStyles.size12w400,
                        ),
                      ),
                      const Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Mobile selection box
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: MyColors.greyColor3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: MyColors.mainColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.phone, color: Colors.white),
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '**** **** 3489',
                          style: CustomTextStyles.size12w400,
                        ),
                      ),
                      const Icon(Icons.check_circle_outline, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Send OTP button
                Center(
                  child: MyButton(
                    title: "Send OTP",
                    width: Get.width * 0.4,
                    height: 45,
                    onPress: () {
                      Get.toNamed(RouteNames.verifyCode);
                      // Get.to(VerifyCode());
                      // Handle OTP send action
                    },
                    titleColor: Colors.white,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
