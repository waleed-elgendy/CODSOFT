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
    required this.fill, required this.textColor,  this.borderColor = Colors.grey,
  });
  final String hint;
  final int? maxLiens;
  final Widget? label, suffix;
  final bool obscure, fill;
  final String? Function(String?)? validate;
  final void Function(String)? onchange;
  final TextInputType? keyType;
  final Color textColor,borderColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:  5.0),
      child: TextFormField(
        validator: validate,
        onChanged: onchange,
        obscureText: obscure,
        maxLines: maxLiens,
        keyboardType: keyType,
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
