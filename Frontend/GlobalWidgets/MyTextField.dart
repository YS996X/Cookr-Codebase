
import 'package:flutter/material.dart';
import '../UTILS/Colors.dart';
import '../UTILS/Textstyles.dart';

class MyTextField extends StatelessWidget {
  String? hintText;
  String? errorText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLength;
  double radius;
  int? maxline;
  bool obSecure;
  bool readOnly;
  double width;
  Color filledColor;
  Color borderSideColor;
  Color hintTextColor;
  Color textColor;
  String? Function(String?)? validator;
  GestureTapCallback? onTap;

  TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  MyTextField({
    super.key,
    this.keyboardType,
     this.prefixIcon,
     this.radius=10,
    this.suffixIcon,
    this.onChanged,
     this.hintText,
     this.hintTextColor=Colors.grey,
     this.textColor=Colors.black,
     this.errorText,
     this.width=double.infinity,
    this.controller,
    this.maxLength,
    this.maxline=1,
    this.validator,
    this.obSecure=false,
    this.readOnly=false,
    this.onTap,
    this.filledColor= Colors.transparent,
    this.borderSideColor= Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: maxline,
        onTap: onTap,
        readOnly: readOnly,
        validator:validator,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLength: maxLength,
        controller: controller,
        obscureText: obSecure,
        cursorColor: MyColors.greyColor,
        style:  TextStyle(color: textColor),
        decoration: InputDecoration(

          contentPadding:  EdgeInsets.symmetric(horizontal: 20, vertical:maxline!=1?10:0 ),
          errorText: errorText,
          errorStyle: const TextStyle(fontSize: 10,color: Colors.red),
          filled: true,
         /// fillColor: Colors.white,
          fillColor: filledColor,
          hintText: hintText,
          hintStyle: CustomTextStyles.size12w500Grey.copyWith(color: hintTextColor),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide:  BorderSide(color: borderSideColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide:  BorderSide(color: borderSideColor),
          ),
        ),
      ),
    );
  }
}
