
import 'package:cookr/UI/MainNavigatonScreen/HomeScreens/addNote/AddNewNote.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController{
  int selectedIndex = 0;

  // Handles bottom navigation item taps
  void onItemTapped(int index) {
    if (index == 0) {

        selectedIndex = index;

    } else if (index == 1) {
      Get.dialog(const AddNewNote());
    } else {

        selectedIndex = index;

    }
    update();
  }
}