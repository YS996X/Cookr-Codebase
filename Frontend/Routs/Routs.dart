import 'package:cookr/UI/ForgotPasswordScreen/ForgotPasswordScreen.dart';
import 'package:cookr/UI/MainNavigatonScreen/MainNavigationScreen.dart';
import 'package:cookr/UI/LoginScreen/LoginScreen.dart';
import 'package:cookr/UI/MainNavigatonScreen/ProfileScreen/EditBio/EditBio.dart';
import 'package:cookr/UI/MainNavigatonScreen/ProfileScreen/LeaderBoardScreen/LeaderBoardScreen.dart';
import 'package:cookr/UI/MainNavigatonScreen/ProfileScreen/Settings/ChangeEmail.dart';
import 'package:cookr/UI/MainNavigatonScreen/ProfileScreen/Settings/ChangeUserName.dart';
import 'package:cookr/UI/MainNavigatonScreen/ProfileScreen/Settings/Credits.dart';
import 'package:cookr/UI/MainNavigatonScreen/ProfileScreen/Settings/SettingsScreen.dart';
import 'package:cookr/UI/MainNavigatonScreen/ProfileScreen/Settings/UpgradeScreen.dart';
import 'package:cookr/UI/NewPasswordScreen/NewPasswordScreen.dart';
import 'package:cookr/UI/SignUpScreen/SignUpScreen.dart';
import 'package:cookr/UI/SplashScreen/SplashScreen.dart';
import 'package:cookr/UI/VerifyCode/VerifyCode.dart';
import 'package:get/get.dart';
import 'RoutsNames.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteNames.splashScreen, page: () =>  SplashScreen(),transition: Transition.fade),
        GetPage(name: RouteNames.loginScreen, page: () =>  const LoginScreen(),transition: Transition.fade),
        GetPage(name: RouteNames.signUpScreen, page: () =>  const SignupScreen(),transition: Transition.fade),
        GetPage(name: RouteNames.verifyCode, page: () =>  VerifyCode(),transition: Transition.fade),
        GetPage(name: RouteNames.newPassword, page: () =>  const Newpasswordscreen(),transition: Transition.fade),
        GetPage(name: RouteNames.mainNavigationScreen, page: () =>  const MainNavigationScreen(),transition: Transition.fade),
        GetPage(name: RouteNames.forgotPasswordScreen, page: () =>  const ForgotPasswordScreen(),transition: Transition.fade),



    GetPage(name: RouteNames.leaderBoardScreen, page: () =>  const LeaderBoardScreen(),transition: Transition.fade),
    GetPage(name: RouteNames.editBio, page: () =>  const EditBio(),transition: Transition.fade),
    GetPage(name: RouteNames.settingsScreen, page: () =>  const SettingsScreen(),transition: Transition.fade),
    GetPage(name: RouteNames.changeUserName, page: () =>  const ChangeUserName(),transition: Transition.fade),
    GetPage(name: RouteNames.changeEmail, page: () =>  const ChangeEmail(),transition: Transition.fade),
    GetPage(name: RouteNames.credits, page: () =>  const Credits(),transition: Transition.fade),
    GetPage(name: RouteNames.upgradeScreen, page: () =>  const UpgradeScreen(),transition: Transition.fade),
      ];
}
