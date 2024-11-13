// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../UTILS/Textstyles.dart';
//
// class CustomDropdownFormField<T> extends StatelessWidget {
//   String? text;
//   final ValueChanged<String?>? onChange;
//   List<String>? actionsList;
//   final double? width;
//   final double? height;
//
//   CustomDropdownFormField({
//     Key? key,
//     this.onChange,
//     this.text,
//     this.actionsList,
//     this.width,
//     this.height
//
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: ,
//       width: width??Get.width*0.25,
//       height: height??Get.height*0.06,
//       child: DropdownButtonFormField(
//         // value: controller.prevState!.state ?? '',
//         isExpanded: true,
//         hint: Text(text!,
//           style: CustomTextStyles.size14w400,
//         ),
//         elevation: 2,
//         onChanged: onChange,
//         items:
//         // controller.states.length==0?controller.tempListForNoItems:
//         actionsList!.map((type) {
//           // controller.prevState=state;
//           return DropdownMenuItem(
//             value: type,
//             child: Text(type,style: CustomTextStyles.size12w500,),
//           );
//         }).toList(),
//         decoration: const InputDecoration(
//           isDense: true,
//
//           contentPadding: EdgeInsets.all(8),
//           ///fillColor: AppColors.greyColor2,
//           filled: true,
//           enabled: true,
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//           ),
//         ),
//       ),
//     );
//   }
// }
