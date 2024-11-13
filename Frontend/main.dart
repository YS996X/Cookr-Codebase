import 'package:cookr/GlobalWidgets/MyButton.dart';
import 'package:cookr/Routs/Routs.dart';
import 'package:cookr/Routs/RoutsNames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// These fucking google {nword placeholder} have made shit complicated
import 'firebase_options.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ButtonController());
    return GetMaterialApp(
      initialRoute: RouteNames.splashScreen,
      getPages: AppRoutes.appRoutes(),
      // // routes: Route,
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: Colors.white,
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white, // Background color of the drawer
          scrimColor: Colors.black.withOpacity(
              0.5), // Color of the scrim (overlay) behind the drawer
          elevation: 16, // Elevation of the drawer
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
          ), // Shape of the drawer
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white, // Background color of the bottom sheet
          modalBackgroundColor:
              Colors.white, // Background color of the modal bottom sheet
          elevation: 16, // Elevation of the bottom sheet
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ), // Shape of the bottom sheet
        ),

      ),
      // home: MainNavigationScreen(),

    );
  }
}
