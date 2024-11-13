import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/Routs/RoutsNames.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Settings',
          style: CustomTextStyles.size22w600W,
        ),
        leading: InkWell(
          onTap: (){
            Get.back();
          },

          child: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current User name',style: CustomTextStyles.size14w500W,),
                    Text('Alson3344_1',style: CustomTextStyles.size14w500Grey,),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(alignment: Alignment.centerRight,child: InkWell(
                  onTap: (){
                    Get.toNamed(RouteNames.changeUserName);
                  },
                  child: Text('Change User name',style: CustomTextStyles.size12w500Blue,)),),
            ),
            const SizedBox(height: 20,),
            Card(
              color: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current Email',style: CustomTextStyles.size14w500W,),
                    Text('Alson3344_1@gmail.com',style: CustomTextStyles.size12w500Grey,),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(alignment: Alignment.centerRight,child: InkWell(
                  onTap: (){
                    Get.toNamed(RouteNames.changeEmail);
                  },
                  child: Text('Change Email',style: CustomTextStyles.size12w500Blue,)),),
            ),
            const SizedBox(height: 30,),
            Card(
              color: Colors.grey.withOpacity(0.3),
              child: ListTile(
                leading: const Icon(Icons.share_rounded,color: Colors.white,),
                title: Text('Share with a Friend',style: CustomTextStyles.size14w500W,),
                trailing: const Icon(Icons.chevron_right,color: Colors.white,),
              ),
            ),
            Card(
              color: Colors.grey.withOpacity(0.3),
              child: ListTile(
                onTap: (){
                  Get.toNamed(RouteNames.credits);
                },
                leading: const Icon(Icons.policy,color: Colors.white,),
                title: Text('Credits',style: CustomTextStyles.size14w500W,),
                trailing: const Icon(Icons.chevron_right,color: Colors.white,),
              ),
            ),
            Card(
              color: Colors.grey.withOpacity(0.3),
              child: ListTile(
                leading: const Icon(Icons.error_outline,color: Colors.white,),
                title: Text('Report an error',style: CustomTextStyles.size14w500W,),
                trailing: const Icon(Icons.chevron_right,color: Colors.white,),
              ),
            ),
            const SizedBox(height: 20,),
            Card(
              color: Colors.grey.withOpacity(0.3),
              child: ListTile(
                // leading:
                title: Row(
                  children: [
                    const Icon(Icons.workspace_premium,color: Colors.white,),
                    const SizedBox(width: 20,),
                    Text('Upgrade Plan',style: CustomTextStyles.size14w500W,),
                  ],
                ),
                subtitle: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 30.0,horizontal: Get.width*0.1),
                  child: MyButton(
                    onPress: (){
                    Get.toNamed(RouteNames.upgradeScreen);
                  },width: Get.width*0.5,borderRadios: 10,color: Colors.yellow[700],titleColor: Colors.black,title: 'Try Cookr Pro',),
                ),
                // trailing: Icon(Icons.chevron_right,color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
