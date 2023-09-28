import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final validator;
  final borderSide;
  final onChanged;

  final enabled;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.validator,
      required this.borderSide,
      required this.enabled,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enabled,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        // errorStyle: TextStyle(height: 0),
        // constraints: const BoxConstraints(maxHeight: 100, minHeight: 50),
        // contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 24),
        contentPadding: EdgeInsets.only(
            top: 10.sp, bottom: 10.sp, left: 24.sp, right: 24.sp),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: borderSide,
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
    

}
}

