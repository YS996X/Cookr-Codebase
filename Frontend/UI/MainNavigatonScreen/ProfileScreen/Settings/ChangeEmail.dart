import 'package:cookr/GlobalWidgets/MyTextField.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 0,
        backgroundColor: Colors.black,
        // leading: Text('Cancel',style: CustomTextStyles.size14w500W,),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Text('Cancel',style: CustomTextStyles.size14w500W,)),
              InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Text('Save',style: CustomTextStyles.size14w500Blue,)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyTextField(
              // maxLength: 30,
              textColor: Colors.white,
              hintText: 'Change Email',filledColor: Colors.grey.withOpacity(0.2),),
            const SizedBox(height: 20,),
            MyTextField(
              // maxLength: 30,
              textColor: Colors.white,
              hintText: 'Password',filledColor: Colors.grey.withOpacity(0.2),)
          ],
        ),
      ),
    );
  }
}
