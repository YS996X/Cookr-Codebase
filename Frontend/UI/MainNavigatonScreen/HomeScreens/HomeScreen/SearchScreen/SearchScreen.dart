
import 'package:cookr/GlobalWidgets/MyTextField.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white,size: 30,),
          onPressed: () {
            Get.back();
            // Handle back navigation
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: MyTextField(
            textColor: Colors.white,
            radius: 10,
            suffixIcon: const Icon(Icons.search),
            hintText: 'Search by mode',
            filledColor: MyColors.greyColor.withOpacity(0.3),
          ),
        ),
      ),
      body: Container(
        color: Colors.black, // Set the background color to black
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // GridView.builder(
            //     gridDelegate: gridDelegate,
            //     itemBuilder: (context,index){
            //       return
            //     }),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.count(
                  childAspectRatio:3/2,
                  crossAxisCount: 2, // 2 buttons per row
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildOptionButton('Standard', Icons.all_inclusive,MyColors.greyColor3),
                    _buildOptionButton('Written Form', Icons.edit,MyColors.greyColor3),
                    _buildOptionButton('Multiple Choice', Icons.list,MyColors.greyColor3),
                    _buildOptionButton('Suggestions', Icons.star,MyColors.greyColor3.withOpacity(0.6)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String label, IconData icon,Color color) {
    return Container(
      // onPressed: () {
      //   // Handle button tap
      // },
      decoration: BoxDecoration(
        color: color, // Button background color
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 40),
          const SizedBox(height: 8),
          Text(label, style: CustomTextStyles.size16w500),
        ],
      ),
    );
  }
}
