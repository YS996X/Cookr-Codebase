import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

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
                  child: const Icon(Icons.chevron_left,color: Colors.white,size: 30,)),
              // InkWell(
              //     onTap: (){
              //       Get.back();
              //     },
              //     child: Text('Save',style: CustomTextStyles.size14w500Blue,)),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('THANK YOU ALL WHO MADE IT POSSIBLE',style: CustomTextStyles.size18w500W,),
            const SizedBox(height: 20,),
            Text('Mehtab Makkar and Alex Chen',style: CustomTextStyles.size16w400W,),
            const SizedBox(height: 40,),
            Text('Special Thanks To ',style: CustomTextStyles.size18w500W,),
            const SizedBox(height: 20,),
            Text('Ayden Lum - Aidan Tobbe - James Fasooto - Malik Aliev - Sebastian Cerro',style: CustomTextStyles.size16w400W,),
          ],
        ),
      ),
    );
  }
}
