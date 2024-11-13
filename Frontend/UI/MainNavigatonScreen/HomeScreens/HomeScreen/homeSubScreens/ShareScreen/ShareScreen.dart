

import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/HomeScreen/homeSubScreens/ShareScreen/ShareScreenController.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareScreen extends StatelessWidget {
   ShareScreen({super.key});
   final controller = Get.put(ShareScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 30,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.chevron_left,color: Colors.white,)),
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text('This Question was sent by', style: CustomTextStyles.size14w500W),
            SizedBox(width: Get.width*0.1,),
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  'https://as2.ftcdn.net/v2/jpg/03/30/25/97/1000_F_330259751_tGPEAq5F5bjxkkliGrb97X2HhtXBDc9x.jpg'), // Replace with the actual image or remove
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Asma332', style: CustomTextStyles.size14w500W),
            ),
          ],
        ),),
      floatingActionButton: GetBuilder<ShareScreenController>(
        builder: (__) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: MyButton(
                  borderRadios: 10,
                  title: "Reveal Answer",
                  width: Get.width * 0.4, // 60% of screen width
                  onPress: () {
                    if (!__.answerRevealed) {
                      __.answerRevealed=true;
                    }
                    __.update();
                    // Handle reveal answer action
                  },
                  titleColor: Colors.white,
                  // color: Colors.blue,
                ),
              ),
              SizedBox(
                  height: Get.height * 0.03),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text('Drivers Test', style: CustomTextStyles.size22w600W),
                ),
              ),
              SizedBox(
                  height: Get.height * 0.005),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),

                  child: Text('Cooked this session 0', style: CustomTextStyles.size14w500W),
                ),
              ),
              SizedBox(
                  height: Get.height * 0.03),
              Container(
                  height: 70,
                  color: Colors.grey.withOpacity(0.2),
                  width: Get.width,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0,top: 10),
                          child: Text('# Education x productivity Platform for Gen- Z', style: CustomTextStyles.size14w500W),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30.0,top: 10,bottom: 10),
                          child: MyButton(
                            isAnimated: false,
                            borderRadios: 10,
                            title: "Join Cookr Now",
                            width: Get.width * 0.2, // 60% of screen width
                            onPress: () {

                              // Handle reveal answer action
                            },
                            titleColor: Colors.white,
                            // color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          );
        }
      ),
      body: GetBuilder<ShareScreenController>(builder: (__) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05), // 5% of screen width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.2, // 20% of screen height
              ),
              // Question
              RichText(
                text: TextSpan(
                  text: "Question : ",
                  style: CustomTextStyles.size16w400Blue,
                  children: [
                    TextSpan(
                      text: '{com.aws.placeholder}',
                      style: CustomTextStyles.size16w400W,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.05),

              AnimatedOpacity(
                opacity: __.answerRevealed ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: __.answerRevealed

                    ? Text('Answer : {com.aws.placeholder}',style: CustomTextStyles.size14w500Blue,)
                    : const SizedBox(),
              ),

            ],
          ),
        );
      }),
    );
  }
}
