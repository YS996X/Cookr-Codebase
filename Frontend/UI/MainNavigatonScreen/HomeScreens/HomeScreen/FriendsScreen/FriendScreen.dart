

import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/GlobalWidgets/MyTextField.dart';
import 'package:cookr/UTILS/Colors.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Friends', style: CustomTextStyles.size22w600W),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Get.back();
            // Handle back press
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              // Invite Friends Button
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // Invite friends logic
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.purple,
              //       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //     child: Text('Invite Friends'),
              //   ),
              // ),
              MyButton(onPress: (){},title: "Invite Friends",height: 50,),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: MyTextField(
                  radius: 10,
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search by username',
                  filledColor: MyColors.greyColor.withOpacity(0.3),
                ),
              ),

              // Search Bar
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: 'Search by username',
              //       filled: true,
              //       fillColor: Colors.grey[800],
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8),
              //         borderSide: BorderSide.none,
              //       ),
              //     ),
              //   ),
              // ),

              // List of Friends
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  // padding: const EdgeInsets.symmetric(vertical: 18.0),
                  itemBuilder: (context,index){
                    return _buildFriendTile('Preston', '@11303178623', '45AP', 'assets/avatar1.png');
                  },
                  // children: [
                  //
                  //   // _buildFriendTile('Mehtaab', '@existentialguy', '0AP', 'assets/avatar_placeholder.png'),
                  //   // Add more friend tiles here...
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Friend Tile Widget
  Widget _buildFriendTile(String name, String username, String power, String avatarPath) {
    return ListTile(
      // dense: true,
      leading:Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
      title: Text(name, style: const TextStyle(color: Colors.white)),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username, style: const TextStyle(color: Colors.grey)),
          const SizedBox(width: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.bolt, color: Colors.blue),
              const SizedBox(width: 4),
              Text(power, style: const TextStyle(color: Colors.grey)),
            ],
          )
        ],
      ),
      trailing:const Icon(Icons.chevron_right,color: Colors.grey,size: 35,),
    );
  }
}