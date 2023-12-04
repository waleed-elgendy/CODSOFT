import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hint,
    super.key,
    this.suffix,
    this.validate,
    this.onchange,
    this.label,
    required this.obscure,
    this.keyType,
    this.maxLiens = 1,
    required this.fill, required this.textColor,  this.borderColor = Colors.grey, this.controller, this.onTap, this.read=false, this.initial,
  });
  final String hint;
  final int? maxLiens;
  final Widget? label, suffix;
  final bool obscure, fill,read;
  final String? Function(String?)? validate;
  final void Function(String?)? onchange;
  final TextInputType? keyType;
  final Color textColor,borderColor;
  final TextEditingController? controller;
  final String? initial;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:  5.0.h),
      child: TextFormField(
        initialValue: initial,
        onTap: onTap,
        controller: controller,
        validator: validate,
        onChanged: onchange,
        obscureText: obscure,
        maxLines: maxLiens,
        keyboardType: keyType,
        readOnly: read,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: suffix,
          label: label,
          filled: fill,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 17.sp,
            color: const Color(0xffB8B8B8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(10.dm),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(10.dm),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.dm),
            ),
          ),
        ),
          style:  TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Segue UI')
      ),
    );
  }
}
