import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/HomeScreen/HomeScreen.dart';
import 'package:cookr/UI/MainNavigatonScreen/MainScreenController.dart';
import 'package:cookr/UI/MainNavigatonScreen/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainNavigationScreen extends StatelessWidget {

  final controller=Get.put(MainScreenController());

  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black,
          // appBar: _selectedIndex == 0
          //     ?
          //     : AppBar(
          //         backgroundColor: Colors.transparent,
          //       ),
          body: GetBuilder<MainScreenController>(
            builder: (__) {
              return controller.selectedIndex == 0
                  ? const HomeScreen()
                  : const ProfileScreen();
            }
          ),
          bottomNavigationBar: GetBuilder<MainScreenController>(
            builder: (__) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(color: Colors.grey.withOpacity(0.3),thickness: 1,),
                  ),
                  BottomNavigationBar(

                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                    currentIndex: controller.selectedIndex,
                    onTap: controller.onItemTapped,
                    type: BottomNavigationBarType.fixed,
                    // splashFactory: NoSplash.splashFactory,
                      elevation:5,

                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Card(
                            margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 2),
                                child: Icon(Icons.add,color: Colors.black,),
                              )),
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ],
              );
            }
          ),
        );
      }
    );
  }
}
