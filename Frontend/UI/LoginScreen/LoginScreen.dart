import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/GlobalWidgets/MyTextField.dart';
import 'package:cookr/Routs/RoutsNames.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/ImgesPaths.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: const SizedBox(),
        title: Text(
          "Sign in",
          style: CustomTextStyles.size18w500W,
        ),
        bottom: const PreferredSize(preferredSize: Size.fromHeight(10), child: Divider(color: MyColors.greyColor3,)),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Blue top bar
                Center(
                    child: SvgPicture.asset(
                  ImagesPaths.logo,
                )),
                const SizedBox(height: 30),

                // Welcome text
                Center(
                  child: Text(
                    'Welcome Back !',
                    style: CustomTextStyles.size18w500W,
                  ),
                ),
                const SizedBox(height: 10),

                // Subtext
                Center(
                  child: Text(
                    'Stay signed in with your account to\nmake searching easier',
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.size12w400W,
                  ),
                ),
                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MyTextField(
                    hintText: "Email",
                    filledColor: MyColors.greyColor3,
                    // suffixIcon: Icon(Icons.search),
                    radius: 10,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MyTextField(
                    hintText: "Password",
                    filledColor: MyColors.greyColor3,
                    suffixIcon: const Icon(Icons.visibility),
                    radius: 10,
                  ),
                ),

                const SizedBox(height: 10),

                // Keep me signed and forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          activeColor: Colors.blueAccent,
                        ),
                        const Text(
                          'Keep me signed',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteNames.forgotPasswordScreen);
                        // Get.to(ForgotPasswordScreen());
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: MyButton(

                    title: "Sign In",
                    width: 200,
                    onPress: () {
                      Get.offNamedUntil(RouteNames.mainNavigationScreen, (route) => false);
                    },
                    titleColor: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),
                // Divider with text
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.white54,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: CustomTextStyles.size11w400W,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.white54,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Google Sign In button
                Center(
                  child: SizedBox(
                      width: Get.width * 0.3,
                      // height: 30,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: MyColors.greyColor3,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImagesPaths.googleIcon,
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Google',
                                style: CustomTextStyles.size14w400,
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
                SizedBox(height: Get.height*0.05,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteNames.signUpScreen);
                      // Get.to(SignupScreen());
                      // Handle navigation to Sign In screen
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: CustomTextStyles.size12w400W,
                        children: const [
                          TextSpan(
                            text: 'Sign up',
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
