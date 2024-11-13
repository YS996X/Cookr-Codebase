// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:get/get.dart';
// import 'package:simple_app/UTILS/Colors.dart';
// import 'package:simple_app/UTILS/Textstyles.dart'; // Import your package or widget
//
// ///. dropdown_button2: ^2.3.9...
//
// class CustomDropdownButton extends StatelessWidget {
//   final List<String> items;
//   final ValueChanged<String?> onChanged;
//   final Widget? customButton;
//   final DropdownStyleData? dropdownStyleData;
//   final MenuItemStyleData? menuItemStyleData;
//   const CustomDropdownButton({
//     super.key,
//     required this.items,
//     required this.onChanged,
//     this.customButton,
//     this.dropdownStyleData,
//     this.menuItemStyleData,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         customButton: customButton ??
//             Container(
//               height: Get.width*.15,
//               width: 50,
//              decoration: BoxDecoration(
//                color: AppColors.greyColor,
//                borderRadius: BorderRadius.circular(10)
//              ),
//               child: const Icon(
//                 Icons.filter_list,
//                 size: 46,
//                 color: Colors.black,
//               ),
//             ),
//         items: [
//           ...items.map(
//             (item) => DropdownMenuItem<String>(
//               value: item,
//               child: _buildMenuItemWidget(item),
//             ),
//           ),
//         ],
//         onChanged: onChanged,
//         dropdownStyleData: dropdownStyleData ??
//             DropdownStyleData(
//               width: 160,
//               padding: const EdgeInsets.symmetric(vertical: 6),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black.withOpacity(.5),
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(20),
//                 color: AppColors.greyColor,
//               ),
//               offset: const Offset(0, 8),
//             ),
//         menuItemStyleData: menuItemStyleData ??
//             MenuItemStyleData(
//               // customHeights: List<double>.filled(items.length, 48),
//               padding: const EdgeInsets.only(left: 16, right: 16),
//             ),
//       ),
//     );
//   }
//
//   Widget _buildMenuItemWidget(String item) {
//     return Row(
//       children: [
//         Expanded(
//           child: Text(
//             item,
//             style: CustomTextStyles.size12w400,
//           ),
//         ),
//       ],
//     );
//   }
// }
