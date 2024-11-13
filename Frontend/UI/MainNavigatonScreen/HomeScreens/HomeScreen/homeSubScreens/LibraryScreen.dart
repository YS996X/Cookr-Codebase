import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/GlobalWidgets/MyTextField.dart';
import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/HomeScreen/homeSubScreens/homeSubScreenController.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryScreen extends StatelessWidget {
  LibraryScreen({super.key});
  final controller = Get.put(HomeSubScreensController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
      child: GetBuilder<HomeSubScreensController>(builder: (__) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyTextField(
                  textColor: Colors.white,
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  width: Get.width * 0.65,
                  filledColor: Colors.grey.withOpacity(0.2),
                  hintText: 'Search',
                ),
                SizedBox(
                  width: Get.width * 0.07,
                ),
                GestureDetector(
                  onTap: () {
                    if (__.librarySelectedItem != 0) {
                      __.librarySelectedItem = 0;
                      __.update();
                    } else if (__.librarySelectedItem == 0 ||
                        __.librarySelectedItem == 1) {
                      __.librarySelectedItem = 2;
                      __.update();
                    }
                  },
                  child: Image.asset(
                    __.librarySelectedItem == 0
                        ? "assets/icons/llikeFill.png"
                        : 'assets/icons/like.png',
                    color: __.librarySelectedItem == 0
                        ? MyColors.mainColor
                        : Colors.white,
                    height: 25,
                    width: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (__.librarySelectedItem != 1) {
                      __.librarySelectedItem = 1;
                      __.update();
                    } else if (__.librarySelectedItem == 0 ||
                        __.librarySelectedItem == 1) {
                      __.librarySelectedItem = 2;
                      __.update();
                    }
                  },
                  child: Image.asset(
                    __.librarySelectedItem == 1
                        ? "assets/icons/saveFill.png"
                        : 'assets/icons/save.png',
                    color: __.librarySelectedItem == 1
                        ? MyColors.mainColor
                        : Colors.white,
                    height: 25,
                    width: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Placeholder Text (Question)

            const SizedBox(height: 10),
            SizedBox(
                    height: Get.height * 0.67,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          __.librarySelectedItem == 0
                              ? 'Liked Questions'
                              : __.librarySelectedItem == 1
                              ?'Saved Questions'
                              :'Study sets',
                          style: CustomTextStyles.size16w400W,
                        ),
                        const SizedBox(height: 10),
                        __.librarySelectedItem == 2
                            ? Expanded(
                                child: ListView.builder(
                                    itemCount: 10,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Card(
                                          elevation: 10,
                                          color: Colors.grey.withOpacity(0.4),
                                          child: ListTile(
                                            tileColor: Colors.transparent,
                                            // dense: true,
                                            title: Text(
                                              'Question: {com.aws.placeholder}',
                                              style:
                                                  CustomTextStyles.size16w400W,
                                            ),
                                            subtitle: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const SizedBox(),
                                                  MyButton(
                                                    isAnimated: false,
                                                    borderRadios: 5,
                                                    height: 50,
                                                    title: "Let me Cook",
                                                    width: Get.width *
                                                        0.6, // Adjusting width for better fit
                                                    onPress: () {
                                                      // __.chunkOpened = true;
                                                      // __.update();
                                                      // Handle button action
                                                    },
                                                    titleColor: Colors.white,
                                                    // color: Colors.blue,
                                                  ),
                                                  IconButton(
                                                    padding: const EdgeInsets.all(10),
                                                    icon: const Icon(
                                                      Icons.delete_outline,
                                                      color: Colors.white,
                                                      size: 35,
                                                    ),
                                                    onPressed: () {
                                                      // Handle delete action
                                                    },
                                                  ),
                                                  const SizedBox(),
                                                ],
                                              ),
                                            ),
                                            // trailing: ,
                                          ));
                                    }),
                              )
                            : Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                        itemCount: 10,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 20),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                // Dark background color
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              // padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Card(
                                                    margin: EdgeInsets.zero,
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            GetBuilder<
                                                                    HomeSubScreensController>(
                                                                builder: (__) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  __.chunkVisible =
                                                                      !__.chunkVisible;
                                                                  __.update();
                                                                },
                                                                child: const Text(
                                                                  "Wood Chuck",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                            const SizedBox(
                                                              width: 30,
                                                            ),
                                                            GetBuilder<
                                                                    HomeSubScreensController>(
                                                                builder: (__) {
                                                              return IconButton(
                                                                onPressed: () {
                                                                  __.chunkOpened =
                                                                      false;
                                                                  __.chunkVisible =
                                                                      false;
                                                                  __.update();
                                                                },
                                                                icon: const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              20.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete_outline,
                                                                    color: MyColors
                                                                        .mainColor,
                                                                    size: 30,
                                                                  ),
                                                                ),
                                                                // Blue trash icon
                                                              );
                                                            }),
                                                          ],
                                                        )
                                                        // ListTile(
                                                        //   dense: true,
                                                        //   // leading: GetBuilder<
                                                        //   //         HomeSubScreensController>(
                                                        //   //     builder: (__) {
                                                        //   //   return IconButton(
                                                        //   //     icon: Icon(Icons.chevron_left),
                                                        //   //     color: Colors.white,
                                                        //   //     onPressed: () {
                                                        //   //       __.chunkOpened = false;
                                                        //   //       __.chunkVisible = false;
                                                        //   //       __.update();
                                                        //   //     },
                                                        //   //   );
                                                        //   // }),
                                                        //   title:
                                                        //   trailing:
                                                        // ),
                                                        ),
                                                  ),
                                                  // Header Row (Title and Delete Icon)
                                                  // Row(
                                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  //   children: [
                                                  //
                                                  //
                                                  //   ],
                                                  // ),
                                                  const SizedBox(height: 40),

                                                  // Question Text
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            "Question: How much wood can a wood chuck chuck if a wood chuck could chuck wood?",
                                                            style:
                                                                CustomTextStyles
                                                                    .size18w500W),
                                                        const SizedBox(height: 20),

                                                        // Answer Text
                                                        GetBuilder<
                                                                HomeSubScreensController>(
                                                            builder: (__) {
                                                          return SizedBox(
                                                            height: Get.height *
                                                                0.1,
                                                            child:
                                                                __.chunkVisible
                                                                    ? RichText(
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                                text: "Answer: ",
                                                                                style: CustomTextStyles.size18w500Blue),
                                                                            TextSpan(
                                                                                text: "A wood chuck would chuck all the wood if a wood chuck could chuck wood.",
                                                                                style: CustomTextStyles.size18w500Blue),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : const SizedBox(),
                                                          );
                                                        }),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
            // Centered Button and Delete Icon
            // Card(
            //   elevation: 10,
            //     color: Colors.grey.withOpacity(0.4),
            //     child: ListTile(
            //       tileColor: Colors.transparent,
            //       // dense: true,
            //       title: Text(
            //         'Question: {com.aws.placeholder}',
            //         style: CustomTextStyles.size16w400W,
            //       ),
            //       subtitle: Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 15.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             MyButton(
            //               height: 50,
            //               title: "Let me Cook",
            //               width: Get.width * 0.6, // Adjusting width for better fit
            //               onPress: () {
            //                 // Handle button action
            //               },
            //               titleColor: Colors.white,
            //               color: Colors.blue,
            //             ),
            //             IconButton(
            //               padding: EdgeInsets.all(10),
            //               icon: Icon(Icons.delete_outline, color: Colors.white,size: 35,),
            //               onPressed: () {
            //                 // Handle delete action
            //               },
            //             )
            //           ],
            //         ),
            //       ),
            //       // trailing: ,
            //     )),
            // SizedBox(height: 10),
            // // Placeholder text
            // Text(
            //   '{com.aws.placeholder}',
            //   style: CustomTextStyles.size14w400W,
            // ),

          ],
        );
      }),
    );
  }
}

class ChunckCard extends StatelessWidget {
  const ChunckCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87, // Dark background color
        borderRadius: BorderRadius.circular(16),
      ),
      // padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.zero,
            color: Colors.grey.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                dense: true,
                leading: GetBuilder<HomeSubScreensController>(builder: (__) {
                  return IconButton(
                    icon: const Icon(Icons.chevron_left),
                    color: Colors.white,
                    onPressed: () {
                      __.chunkOpened = false;
                      __.chunkVisible = false;
                      __.update();
                    },
                  );
                }),
                title: GetBuilder<HomeSubScreensController>(builder: (__) {
                  return GestureDetector(
                    onTap: () {
                      __.chunkVisible = true;
                      __.update();
                    },
                    child: const Text(
                      "Wood Chuck",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  );
                }),
                trailing: GetBuilder<HomeSubScreensController>(builder: (__) {
                  return IconButton(
                    onPressed: () {
                      __.chunkOpened = false;
                      __.chunkVisible = false;
                      __.update();
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: MyColors.mainColor,
                      size: 30,
                    ),
                    // Blue trash icon
                  );
                }),
              ),
            ),
          ),
          // Header Row (Title and Delete Icon)
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //
          //
          //   ],
          // ),
          const SizedBox(height: 40),

          // Question Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                    "Question: How much wood can a wood chuck chuck if a wood chuck could chuck wood?",
                    style: CustomTextStyles.size18w500W),
                const SizedBox(height: 20),

                // Answer Text
                GetBuilder<HomeSubScreensController>(builder: (__) {
                  return __.chunkVisible
                      ? RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Answer: ",
                                  style: CustomTextStyles.size18w500Blue),
                              TextSpan(
                                  text:
                                      "A wood chuck would chuck all the wood if a wood chuck could chuck wood.",
                                  style: CustomTextStyles.size18w500Blue),
                            ],
                          ),
                        )
                      : const SizedBox();
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
