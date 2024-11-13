

import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSubScreensController extends GetxController{
  int librarySelectedItem=0;

  PageController pageController = PageController();
  bool chunkOpened=false;
  bool chunkVisible=false;

  List revealedAnswers=[];
  List likedQuestions=[];
  List savedQuestions=[];


  List letters=[
    'A',"B","C","D"
  ];
  List options=[
    'option a',"option b","option c","option d"
  ];
int? correctAnswerIndex=2;





  // Widget buildOptionTile(String letter, String optionText, {bool isSelected = false}) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: isSelected ? result?MyColors.mainColor:Colors.white : Colors.grey[800],
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       child: ListTile(
  //         dense: true,
  //           contentPadding:EdgeInsets.all(5),
  //         leading: CircleAvatar(
  //           backgroundColor: isSelected ? Colors.black.withOpacity(0.2) : Colors.grey,
  //           child: Text(
  //             letter,
  //             style: isSelected ?CustomTextStyles.size14w400:CustomTextStyles.size14w400W,
  //           ),
  //         ),
  //         title: Text(
  //           optionText,
  //           style: isSelected ? CustomTextStyles.size14w500 : CustomTextStyles.size14w500Grey,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  int? selectedOptionIndex; // The option the user selects
  bool showAnswer = false;
  void revealAnswer() {
    // setState(() {

      showAnswer = true;
      update();
    // });
  }


  Widget buildOptionTile(int index) {
    Color backgroundColor;
    if (showAnswer) {
      // If the answer is revealed, set the color based on correctness
      if (index == selectedOptionIndex && index == correctAnswerIndex) {
        backgroundColor = MyColors.mainColor; // Correct and selected
      } else if (index == selectedOptionIndex && index != correctAnswerIndex) {
        backgroundColor = MyColors.pinkColor; // Incorrect and selected
      } else if (index == correctAnswerIndex) {
        backgroundColor = MyColors.mainColor; // Correct answer
      } else {
        backgroundColor = Colors.grey[400]!; // Unselected normal options
      }
    } else {
      // Before revealing the answer, all options are grey or white if selected
      backgroundColor = index == selectedOptionIndex ? Colors.white : Colors.grey[400]!;
    }

    return GestureDetector(
      onTap: () {
        if (!showAnswer) {
          update();
          // setState(() {
            selectedOptionIndex = index; // Set the selected option
          // });
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[600]!,
              child: Text(
                String.fromCharCode(65 + index), // A, B, C, D based on index
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              options[index],
              style: index == correctAnswerIndex && showAnswer || index == selectedOptionIndex && showAnswer ?CustomTextStyles.size14w500W:CustomTextStyles.size14w500,
            ),
          ],
        ),
      ),
    );
  }
}