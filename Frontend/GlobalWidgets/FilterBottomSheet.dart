import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UTILS/Colors.dart';
import '../UTILS/Textstyles.dart';
import 'MyButton.dart';

filterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          he2(),
          Center(
              child: Text('Filters', style: CustomTextStyles.size18w500)),
          const Divider(
            color: MyColors.greyColor2,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: MyTextField(
          //     controller: TextEditingController(text: "Filter tasks by task status"),
          //     readOnly: true,
          //     borderSideColor: MyColors.greyColor,
          //     suffixIcon: const Icon(Icons.arrow_forward_ios,color: MyColors.greyColor,),
          //   ),
          // ),
          // Card(
          //   color: Colors.white, // Background color of the card
          //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          //   shape: RoundedRectangleBorder(
          //     side: BorderSide(color: MyColors.greyColor2,), // Border color and width
          //     borderRadius: BorderRadius.circular(8), // Border radius
          //   ),
          //   child: ListTile(
          //     contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          //     title: Text(
          //       "Filter tasks by task status",
          //       style: CustomTextStyles.size14w500,
          //     ),
          //     trailing: Icon(Icons.arrow_forward_ios, color: MyColors.greyColor),
          //     onTap: () {
          //
          //     },
          //   ),
          // ),
          // Card(
          //   color: Colors.white, // Background color of the card
          //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          //   shape: RoundedRectangleBorder(
          //     side: BorderSide(color: MyColors.greyColor2,), // Border color and width
          //     borderRadius: BorderRadius.circular(8), // Border radius
          //   ),
          //   child: ListTile(
          //     contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          //     title: Text(
          //       "Filter tasks by labels",
          //       style: CustomTextStyles.size14w500,
          //     ),
          //     trailing: Icon(Icons.arrow_forward_ios, color: MyColors.greyColor),
          //     onTap: () {
          //
          //     },
          //   ),
          // ),
          // Card(
          //   color: Colors.white, // Background color of the card
          //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          //   shape: RoundedRectangleBorder(
          //     side: BorderSide(color: MyColors.greyColor2,), // Border color and width
          //     borderRadius: BorderRadius.circular(8), // Border radius
          //   ),
          //   child: ListTile(
          //     contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          //     title: Text(
          //       "Filter tasks by creation time",
          //       style: CustomTextStyles.size14w500,
          //     ),
          //     trailing: Icon(Icons.arrow_forward_ios, color: MyColors.greyColor),
          //     onTap: () {
          //
          //     },
          //   ),
          // ),
          FilterCard(text: 'Filter tasks by task status', onTap: () { Get.back(); },),
          FilterCard(text: 'Filter tasks by labels', onTap: () { Get.back(); },),
          FilterCard(text: 'Filter tasks by creation time', onTap: () {  Get.back();},),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: MyTextField(
          //     controller: TextEditingController(text: "Filter tasks by labels"),
          //     readOnly: true,
          //     borderSideColor: MyColors.greyColor,
          //     suffixIcon: Icon(Icons.arrow_forward_ios,color: MyColors.greyColor,),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: MyTextField(
          //     controller: TextEditingController(text: "Filter tasks by creation time"),
          //     readOnly: true,
          //     borderSideColor: MyColors.greyColor,
          //     suffixIcon: const Icon(Icons.arrow_forward_ios,color: MyColors.greyColor,),
          //   ),
          // ),
          const Divider(
            color: MyColors.greyColor2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: MyButton(
                    onPress: () {},
                    color: Colors.transparent,
                    borderRadios: 30,
                    title: "Close",
                    titleColor: Colors.grey,
                    borderColor: Colors.grey,
                  ),
                ),
                we5(),
                Expanded(
                  child: MyButton(
                    onPress: () {},
                    borderRadios: 30,
                    color: MyColors.color2,
                    title: "Apply filters",
                    titleColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          he2()
        ],
      );
    },
  );
}


class FilterCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const FilterCard({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[600]),
        onTap: onTap,
      ),
    );
  }
}