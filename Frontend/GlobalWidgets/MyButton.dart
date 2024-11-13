import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonController extends GetxController {
  var isPressed = false;

  void pressButton() {
    isPressed = true;
    update(); // Rebuild when button is pressed
  }

  void releaseButton() async {
    isPressed = false;
    update();

    // Rebuild when button is released
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onPress;
  final double width;
  final double height;
  final double borderRadios;
  final String title;
  final bool loading;
  final Color? color;
  final Color? titleColor;
  final Color? borderColor;
  final bool isAnimated; // New flag for enabling/disabling animation

  const MyButton({
    super.key,
    this.loading = false,
    required this.onPress,
    this.title = 'Log In',
    this.height = 40,
    this.width = double.infinity,
    this.borderRadios = 5.0,
    this.color = MyColors.mainColor,
    this.borderColor,
    this.titleColor,
    this.isAnimated = true, // Default to true for animation
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        if (isAnimated) {
          // Trigger animation when pressed if isAnimated is true
          Get.find<ButtonController>().pressButton();
          // print('tap down');
        }
      },
      onTapUp: (_) {
        if (isAnimated) {
          Get.find<ButtonController>().releaseButton();
          // print('tap up');
          onPress();
        } else {
          onPress(); // Call the press action directly if no animation
        }
      },
      onTapCancel: () {
        if (isAnimated) {
          // print('tap cancel');
          Get.find<ButtonController>().releaseButton();
        }
      },
      child: GetBuilder<ButtonController>(
        builder: (controller) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            transform: isAnimated
                ? Matrix4.translationValues(0, controller.isPressed ? 5 : 0, 0)
                : Matrix4.translationValues(0, 0, 0), // No animation if false
            decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(borderRadios),
              color: color,
              boxShadow: !isAnimated
                  ? []
                  : isAnimated && controller.isPressed
                      ? []
                      : [
                          BoxShadow(
                            color: color!.withOpacity(0.5),
                            offset: const Offset(0, 5),
                            blurRadius: 1,
                          ),
                        ],
            ),
            height: height,
            width: width,
            child: Center(
              child: loading
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      title,
                      style: CustomTextStyles.size14w500W
                          .copyWith(color: titleColor),
                    ),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../UTILS/Colors.dart';
// import '../UTILS/Textstyles.dart';
//
// class MyButton extends StatelessWidget {
//   final VoidCallback onPress;
//   final double width;
//   final double height;
//   final double borderRadios;
//   final String title;
//   final bool loading;
//   final Color? color;
//   final Color? titleColor;
//   final Color? borderColor;
//
//   const MyButton(
//       {super.key,
//       this.loading = false,
//       required this.onPress,
//       this.title = 'Log In',
//       this.height =40,
//       this.width = double.infinity,
//       this.borderRadios = 5.0,
//       this.color = MyColors.mainColor,
//         this.borderColor, this.titleColor});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPress,
//       child: Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//
//           border: Border.all(color: borderColor?? Colors.transparent),
//           borderRadius: BorderRadius.circular(borderRadios),
//           color: color,
//         ),
//         child: Center(
//           child: loading
//               ? const SizedBox(
//                   height: 18,
//                   width: 18,
//                   child: CircularProgressIndicator(
//                     strokeWidth: 2,
//                     color: Colors.white,
//                   ),
//                 )
//               : Text(
//                   title,
//                   style: CustomTextStyles.size14w500W.copyWith(color: titleColor),
//                 ),
//         ),
//       ),
//     );
//   }
// }

he5() {
  return SizedBox(
    height: Get.height * .05,
  );
}

he2() {
  return SizedBox(
    height: Get.height * .02,
  );
}

he1() {
  return SizedBox(
    height: Get.height * .01,
  );
}

we2() {
  return SizedBox(
    width: Get.width * .02,
  );
}

we1() {
  return SizedBox(
    width: Get.width * .01,
  );
}

we5() {
  return SizedBox(
    width: Get.width * .05,
  );
}
