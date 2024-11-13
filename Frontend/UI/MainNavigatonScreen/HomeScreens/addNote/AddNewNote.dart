import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/GlobalWidgets/MyTextField.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'note_controller.dart'; // Import your controller


class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Adjust background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close Button and Create Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Get.back();
                      // Close action here
                    },
                  ),
                  MyButton(
                    isAnimated: false,
                    onPress: () {
                      Get.back();
                    },
                    title: 'Create',
                    width: 100,
                    borderRadios: 50,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MyTextField(
                filledColor: MyColors.greyColor3.withOpacity(0.2),
                hintText: 'Title',
                textColor: Colors.white,
              ),
              // Input Field
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[800],
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: const TextField(
              //     style: TextStyle(color: Colors.white),
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       hintText: "Input Field",
              //       hintStyle: TextStyle(color: Colors.grey),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              // Notes Input Area
              // Container(
              //   height: 200,
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[900],
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: const TextField(
              //     maxLines: null,
              //     style: TextStyle(color: Colors.white),
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       hintText: "Enter notes...",
              //       hintStyle: TextStyle(color: Colors.grey),
              //     ),
              //   ),
              // ),
              MyTextField(
                filledColor: MyColors.greyColor3.withOpacity(0.2),
                hintText: 'Enter Notes...',
                maxline: 10,
                textColor: Colors.white,

              ),
              const Spacer(),
              // Bottom Row: Share, Edit, and Extract PDF Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Row(
                  //   children: [
                  //     IconButton(
                  //       icon:
                  //           Icon(Icons.share_outlined, color: Colors.grey[500]),
                  //       onPressed: () {
                  //         // Share action here
                  //       },
                  //     ),
                  //     // IconButton(
                  //     //   icon: Icon(Icons.edit, color: Colors.grey[500]),
                  //     //   onPressed: () {
                  //     //     // Edit action here
                  //     //   },
                  //     // ),
                  //   ],
                  // ),
                  MyButton(
                    isAnimated: false,
                    onPress: () {
                      Get.dialog(const ExtractPDF());
                    },
                    title: 'Extract PDF',
                    width: 130,
                    borderRadios: 50,
                    color: MyColors.greyColor3.withOpacity(0.2),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ExtractPDF extends StatelessWidget {
  const ExtractPDF({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.grey.withOpacity(0.8),

      // title:
      content: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Get.back();
                // Close action here
              },
            ),
          ),
          Container(
            height: 100,
            width: Get.width * 0.6,
            decoration: BoxDecoration(
                color: const Color(0xFF222222),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                'Click To upload a File',
                style: CustomTextStyles.size12w500W,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            filledColor: const Color(0xFF222222),
            hintText: 'Title',
            width: Get.width * 0.6,
            textColor: Colors.grey,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
