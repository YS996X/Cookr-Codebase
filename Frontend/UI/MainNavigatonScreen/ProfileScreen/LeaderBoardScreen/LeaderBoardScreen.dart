import 'package:cookr/GlobalWidgets/MyTextField.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Universal Leaderboard',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.black,
            child: Column(
              children: [
                Center(
                    child: Text(
                      'increase your Aura to advance',
                      style: CustomTextStyles.size14w500W,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                  child: MyTextField(
                    textColor: Colors.white,
                    radius: 50,
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    filledColor: MyColors.greyColor.withOpacity(0.3),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: Text(
                      'Must be 300AP or above',
                      style: CustomTextStyles.size14w400W,
                    )),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: Get.width * 0.1, vertical: 20),
                  child: const Divider(color: MyColors.greyColor3, thickness: 1),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              // reverse: true,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: ListTile(
                  tileColor: Colors.transparent,
                  dense: true,
                  onTap: () {},
                  splashColor: MyColors.mainColor,
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ), // Replace with your color
                    child: Center(
                      child: Text('${index+1}',style: CustomTextStyles.size12w400W,),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50),
                          ), // Replace with your color
                          child: const Center(
                            child: Text(
                              'AD',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Place Holder', // Text passed from outside
                          style: CustomTextStyles.size12w500W,
                        ),
                      ],
                    ),
                  ),
                  trailing: Text('${(index+1)*100}AP',style: CustomTextStyles.size14w500W,),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
