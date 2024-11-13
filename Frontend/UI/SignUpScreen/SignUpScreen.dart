import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/GlobalWidgets/MyTextField.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Sign Up",
          style: CustomTextStyles.size18w500W,
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Divider(
              color: MyColors.greyColor3,
            )),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Signup title

                const SizedBox(height: 20),

                // Personal detail text
                Text(
                  'Enter your personal details',
                  style: CustomTextStyles.size14w500W,
                ),
                const SizedBox(height: 30),

                // Full Name field
                MyTextField(
                  hintText: "Full Name",
                  filledColor: MyColors.greyColor3,
                  radius: 10,
                ),
                const SizedBox(height: 20),

                // Email field
                MyTextField(
                  hintText: "Email",
                  filledColor: MyColors.greyColor3,
                  radius: 10,
                ),
                const SizedBox(height: 20),

                // New password field
                MyTextField(
                  hintText: "New password",
                  filledColor: MyColors.greyColor3,
                  suffixIcon: const Icon(Icons.visibility),
                  radius: 10,
                ),
                const SizedBox(height: 20),

                // Confirm password field
                MyTextField(
                  hintText: "Confirm password",
                  filledColor: MyColors.greyColor3,
                  radius: 10,
                ),
                const SizedBox(height: 20),

                // Cell number field
                MyTextField(
                  hintText: "Cell#",
                  filledColor: MyColors.greyColor3,
                  radius: 10,
                ),
                const SizedBox(height: 20),

                // Address field
                MyTextField(
                  hintText: "Address",
                  filledColor: MyColors.greyColor3,
                  radius: 10,
                ),
                const SizedBox(height: 30),

                // Sign Up button
                Center(
                  child: MyButton(
                    title: "Sign up",
                    width: Get.width * 0.3,
                    onPress: () {
                      Get.back();
                    },
                    titleColor: Colors.white,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),

                // Sign in link
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      // Handle navigation to Sign In screen
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: CustomTextStyles.size12w400W,
                        children: const [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
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
