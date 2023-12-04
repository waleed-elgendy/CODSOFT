import 'package:flutter/material.dart';
import 'package:todo/sharedWidgets/custom_text.dart';
import 'package:todo/sharedWidgets/custom_text_field.dart';

class DateOrTimeWidget extends StatelessWidget {
  const DateOrTimeWidget({
    super.key,
    required this.hint,
    required this.icon,
     this.onPressed,
    this.controller,
    this.onTap,
  });
  final String hint;
  final Widget icon;
  final VoidCallback? onPressed;
  final TextEditingController? controller;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: CustomText(
          text: hint,
        ),
        subtitle: CustomTextField(
          borderColor: Colors.grey.withOpacity(0.4),
          read: true,
          onTap: onTap,
          controller: controller,
          fill: true,
          textColor: Colors.black,
          maxLiens: 1,
          keyType: TextInputType.datetime,
          hint: hint,
          suffix: IconButton(
            icon: icon,
            onPressed: onPressed,
            color: const Color(0xff4A3780),
          ),
          obscure: false,
        ),
      ),
    );
  }
}
