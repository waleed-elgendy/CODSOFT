import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/sharedWidgets/category_list.dart';
import 'package:todo/sharedWidgets/custom_button.dart';
import 'package:todo/sharedWidgets/custom_text.dart';
import 'package:todo/sharedWidgets/custom_text_field.dart';
import 'package:todo/sharedWidgets/dateTime_widget.dart';
import 'package:todo/sharedWidgets/positioned_circle.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.xmark),
            onPressed: () {
              Navigator.pop(context);
            },
            color: const Color(0xff4A3780),
          ),
        ),
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Add New Task",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Stack(
        children: [
          const Positioned(
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            child: Container(
              color: const Color(0xff4A3780),
              width: double.infinity,
              height: 100.h,
            ),
          ),
          PositionedCircle(
            left: -140.w,
            top: -45.h,
            width: 280.w,
            height: 300.h,
          ),
          PositionedCircle(
            right: -100.w,
            top: -45.h,
            width: 180.w,
            height: 180.h,
          ),
          Positioned(
            top: 120.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: CustomText(
                    text: "Task Title",
                  ),
                  subtitle: CustomTextField(
                    hint: 'Task Title',
                    obscure: false,
                    fill: true,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CategoryList(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    DateOrTimeWidget(
                      onPressed: () async {
                        var datePicked = await DatePicker.showSimpleDatePicker(
                          backgroundColor: Colors.white,
                          context,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2090),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          looping: true,
                        );
                        print(datePicked);
                      },
                      hint: 'Date',
                      icon: const Icon(FontAwesomeIcons.calendar),
                    ),
                    SizedBox(width: 15.w),
                    DateOrTimeWidget(
                      onPressed: () async {
                        final TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 7, minute: 15),
                        );
                        print(newTime);
                      },
                      hint: 'Time',
                      icon: const Icon(Icons.access_time),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: CustomText(text: "Notes"),
                  subtitle: CustomTextField(
                    obscure: false,
                    hint: 'Notes',
                    maxLiens: 7,
                    fill: true, textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 65.h,
                ),
                CustomButton(
                  color: const Color(0xff4A3780),
                  text: 'Save',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
