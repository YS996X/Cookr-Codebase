import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/Routs/RoutsNames.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class VerifyCode extends StatelessWidget {
  final focusedBorderColor = const Color.fromRGBO(23, 171, 144, 1);
  final fillColor = const Color.fromRGBO(243, 246, 249, 0);
  final borderColor = const Color.fromRGBO(23, 171, 144, 0.4);



  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 22,
      color: MyColors.mainColor,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: MyColors.greyColor3),
    ),
  );

  VerifyCode({super.key});


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


                  // Text(
                  //   '',
                  //   style: CustomTextStyles.size14w500W,
                  //   textAlign: TextAlign.start,
                  // ),
                ),
                const SizedBox(height: 20,),
                Pinput(
                  length: 5,
                  // You can pass your own SmsRetriever implementation based on any package
                  // in this example we are using the SmartAuth
                  // smsRetriever: smsRetriever,
                  // controller: pinController,
                  // focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 12),
                  validator: (value) {
                    return value == '22222' ? null : 'Pin is incorrect';
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: MyColors.greyColor3,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: MyColors.mainColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: MyColors.greyColor4),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: MyColors.orangeColor),
                  ),
                ),
                SizedBox(height: Get.height*0.05,),

                // SizedBox(height: 20),
                //
                // // Email selection box
                // Container(
                //   padding: EdgeInsets.all(15),
                //   decoration: BoxDecoration(
                //     color: MyColors.greyColor3,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Row(
                //     children: [
                //       Container(
                //           decoration: BoxDecoration(
                //             color: MyColors.mainColor,
                //             borderRadius: BorderRadius.circular(50),
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Icon(Icons.email, color: Colors.white),
                //           )),
                //       SizedBox(width: 10),
                //       Expanded(
                //         child: Text(
                //           '********@mail.com',
                //           style: CustomTextStyles.size12w400,
                //         ),
                //       ),
                //       Icon(Icons.check_circle, color: Colors.green),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 20),
                //
                // // Mobile selection box
                // Container(
                //   padding: EdgeInsets.all(15),
                //   decoration: BoxDecoration(
                //     color: MyColors.greyColor3,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Row(
                //     children: [
                //       Container(
                //           decoration: BoxDecoration(
                //             color: MyColors.mainColor,
                //             borderRadius: BorderRadius.circular(50),
                //           ),
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Icon(Icons.phone, color: Colors.white),
                //           )),
                //       SizedBox(width: 10),
                //       Expanded(
                //         child: Text(
                //           '**** **** 3489',
                //           style: CustomTextStyles.size12w400,
                //         ),
                //       ),
                //       Icon(Icons.check_circle_outline, color: Colors.white),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 30),

                // Send OTP button
                Center(
                  child: MyButton(
                    title: "Send OTP",
                    width: Get.width * 0.4,
                    height: 45,
                    onPress: () {
                      Get.toNamed(RouteNames.newPassword);
                      // Get.to(Newpasswordscreen());
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
