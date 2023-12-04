import 'package:flutter/material.dart';
import 'package:todo/sharedWidgets/custom_text.dart';
import 'package:todo/sharedWidgets/custom_text_field.dart';

class DateOrTimeWidget extends StatelessWidget {
  const DateOrTimeWidget({
    super.key,
    required this.hint,
    required this.icon,
    required this.onPressed,
  });
  final String hint;
  final Widget icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: CustomText(
          text: hint,
        ),
        subtitle: CustomTextField(
          fill: true,
          textColor: Colors.white,
          maxLiens: 1,
          keyType: TextInputType.datetime,
          hint: hint,
          suffix: IconButton(
            icon: icon,
            onPressed: onPressed,
            color: const Color(0xff4A3780),
          ), obscure: false,
        ),
      ),
    );
  }
}
