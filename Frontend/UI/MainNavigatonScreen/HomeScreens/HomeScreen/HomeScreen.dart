

import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/HomeScreen/FriendsScreen/FriendScreen.dart';
import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/HomeScreen/SearchScreen/SearchScreen.dart';
import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/HomeScreen/homeSubScreens/CookScreen.dart';
import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/HomeScreen/homeSubScreens/LibraryScreen.dart';
import 'package:cookr/UTILS/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,initialIndex:1);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 40),
          icon: const Icon(
            Icons.people,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Get.to(const FriendsScreen());
            // Handle friends button action
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TabBar(
            overlayColor:WidgetStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            dividerColor: Colors.transparent,
            controller: _tabController,
            indicatorColor: Colors.white,
            labelStyle: CustomTextStyles.size18w500W,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Library'),
              Tab(text: 'Cook'),
            ],
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 40),
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Get.to(const SearchScreen());
              // Handle search action
            },
          ),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [LibraryScreen(), CookScreen()],
      ),
    );
  }
}
