import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/HomeScreen/homeSubScreens/ShareScreen/ShareScreen.dart';
import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/HomeScreen/homeSubScreens/homeSubScreenController.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CookScreen extends StatelessWidget {
  CookScreen({super.key});
  final controller = Get.put(HomeSubScreensController());

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: controller.pageController,
      itemCount: 10,
      itemBuilder: (context, index) {
        return GetBuilder<HomeSubScreensController>(builder: (__) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05), // 5% of screen width
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.2, // 20% of screen height
                    ),
                    // Question
                    // index == 0
                    // ? Padding(
                    //     padding:
                    //          EdgeInsets.only(left: 10),
                    //     child: SizedBox(
                    //       width: Get.width*0.7,
                    //       child: ListView.builder(
                    //           shrinkWrap: true,
                    //           itemCount: __.letters.length,
                    //           itemBuilder: (context,index){
                    //         return GestureDetector(
                    //           onTap: (){
                    //             __.selectedOption=index;
                    //             __.update();
                    //           },
                    //           child: __.buildOptionTile(__.letters[index], __.options[index],
                    //               isSelected: __.selectedOption==null||__.selectedOption!=index?false:true),
                    //         );
                    //       })
                    //     ),
                    //   )
                    index == 0
                        ? Column(
                          children: [
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
                            const SizedBox(height: 30,),
                            Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SizedBox(
                                  width: Get.width * 0.68,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: __.options.length,
                                      itemBuilder: (context, index) {
                                        return __.buildOptionTile(index);
                                      }),
                                ),
                              ),
                          ],
                        )
                        : RichText(
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
                      opacity: __.revealedAnswers.contains(index) ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: __.revealedAnswers.contains(index)
                          ? Text(
                              'Answer : {com.aws.placeholder}',
                              style: CustomTextStyles.size14w500Blue,
                            )
                          : const SizedBox(),
                    )
                    // __.revealedAnswers.contains(index)
                    //     ? RichText(
                    //       text: TextSpan(
                    //         text: "Answer : ",
                    //         style: CustomTextStyles.size16w400Blue,
                    //         children: [
                    //           TextSpan(
                    //             text: '{com.aws.placeholder}',  // Placeholder for dynamic text
                    //             style: CustomTextStyles.size16w400W,
                    //           ),
                    //         ],
                    //       ),
                    //     )
                    //     : SizedBox(),

                    // 15% of screen height
                    // __.revealedAnswers.contains(index)
                    //     ? AnimatedOpacity(
                    //   opacity: 1,
                    //       duration: Duration(seconds: 5),
                    //       child: RichText(
                    //           text: TextSpan(
                    //             text: "Answer : ",
                    //             style: CustomTextStyles.size16w400Blue,
                    //             children: [
                    //               TextSpan(
                    //                 text: '{com.aws.placeholder}',
                    //                 style: CustomTextStyles.size16w400W,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //     )
                    //     : SizedBox(),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: Get.width * 0.025, // 2.5% of screen width
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              height:
                                  Get.height * 0.15), // 15% of screen height
                          Padding(
                            padding: EdgeInsets.only(
                                left: Get.width * 0.05), // 5% of screen width
                            child: MyButton(
                              isAnimated: true,
                              borderRadios: 10,
                              title: "Reveal Answer",
                              width: Get.width * 0.6, // 60% of screen width
                              onPress: () {
                                __.update();
                                if (index == 0) {
                                  __.revealAnswer();
                                } else {
                                  if (!__.revealedAnswers.contains(index)) {
                                    __.revealedAnswers.add(index);
                                  }
                                }
                                __.update();
                                // Handle reveal answer action
                              },
                              titleColor: Colors.white,
                              // color: Colors.blue,
                            ),
                          ),


                          const SizedBox(
                              height: 30),
                          // 2% of screen height
                          Text(
                            'com.aws.placeholder',
                            style: CustomTextStyles.size14w800W,
                          ),
                          const SizedBox(
                              height: 10),
                          Text(
                            'Cooked this session: {com.aws.placeholder}',
                            style: CustomTextStyles.size12w400W,
                          ),
                          const SizedBox(
                              height: 10),
                        ],
                      ),
                      SizedBox(
                        width: Get.width * 0.1, // 10% of screen width
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (__.likedQuestions.contains(index)) {
                                __.likedQuestions.remove(index);
                              } else {
                                __.likedQuestions.add(index);
                              }
                              __.update();
                            },
                            child: Image.asset(
                              __.likedQuestions.contains(index)
                                  ? 'assets/icons/llikeFill.png'
                                  : 'assets/icons/like.png',
                              color:__.likedQuestions.contains(index)
                                  ?  MyColors.mainColor:Colors.white,
                              height: Get.height * 0.04, // 5% of screen height
                              width: Get.height * 0.04, // 5% of screen height
                            ),
                          ),
                          SizedBox(
                              height: Get.height * 0.03), // 3% of screen height
                          GestureDetector(
                            onTap: () {
                              if (__.savedQuestions.contains(index)) {
                                __.savedQuestions.remove(index);
                              } else {
                                __.savedQuestions.add(index);
                              }
                              __.update();
                            },
                            child: Image.asset(
                              __.savedQuestions.contains(index)
                                  ? 'assets/icons/saveFill.png'
                                  : 'assets/icons/save.png',
                              color: __.savedQuestions.contains(index)
                                  ?  MyColors.mainColor:Colors.white,
                              height: Get.height * 0.035, // 5% of screen height
                              width: Get.height * 0.035, // 5% of screen height
                            ),
                          ),
                          SizedBox(
                              height: Get.height * 0.035), // 3% of screen height
                          InkWell(
                            onTap: () {
                              Get.to(ShareScreen());
                            },
                            child: Image.asset(
                              'assets/icons/share.png',
                              height: Get.height * 0.035, // 5% of screen height
                              width: Get.height * 0.035,
                              color: Colors.white,// 5% of screen height
                            ),
                          ),
                          SizedBox(
                              height: Get.height * 0.01), // 1% of screen height
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          );
        });
      },
    );
  }
}
