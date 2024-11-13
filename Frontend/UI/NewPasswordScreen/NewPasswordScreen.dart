
import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/GlobalWidgets/MyTextField.dart';
import 'package:cookr/UI/LoginScreen/LoginScreen.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Newpasswordscreen extends StatelessWidget {
  const Newpasswordscreen({super.key});



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
                // SizedBox(height: Get.height*0.2,),
                Lottie.asset(
                  'assets/lottie/1.json',
                  // repeat:false,
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                // SizedBox(height: Get.height*0.1,),
                // Center(child: SizedBox(height: 20)),
                // Lottie.asset(
                //   'assets/lottie/3.json',
                //   // repeat:false,
                //   width: 200,
                //   height: 200,
                //   fit: BoxFit.fill,
                // ),
                // SizedBox(height: Get.height * 0.2),

                // Description text
                SizedBox(height: Get.height*0.2,),

                Align(
                  alignment: Alignment.centerLeft,
                  child:
                  RichText(
                    text: TextSpan(
                      text: 'Please enter the code we just sent to Email  ',
                      style: CustomTextStyles.size16w500W,
                      children: [
                        TextSpan(
                            text: '***********123@gmail.com',
                            style: CustomTextStyles.size16w500Blue
                        ),
                      ],
                    ),
                  ),

                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MyTextField(
                    hintText: "New password",
                    filledColor: MyColors.greyColor3,
                    // suffixIcon: Icon(Icons.search),
                    radius: 10,
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MyTextField(
                    hintText: "Confirm New password",
                    filledColor: MyColors.greyColor3,
                    // suffixIcon: Icon(Icons.search),
                    radius: 10,
                  ),
                ),

                const SizedBox(height: 30,),
                // Send OTP button
                Center(
                  child: MyButton(
                    title: "Done",
                    width: Get.width * 0.4,
                    height: 45,
                    onPress: () {
                      Get.off(const LoginScreen());
                      // Handle OTP send action
                    },
                    titleColor: Colors.white,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
