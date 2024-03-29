// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo/helper/show_snack_bar.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/notification_services.dart';
import 'package:todo/sharedWidgets/category_list.dart';
import 'package:todo/sharedWidgets/custom_app_bar.dart';
import 'package:todo/sharedWidgets/custom_button.dart';
import 'package:todo/sharedWidgets/custom_text.dart';
import 'package:todo/sharedWidgets/custom_text_field.dart';
import 'package:todo/sharedWidgets/dateTime_widget.dart';
import 'package:todo/sharedWidgets/first_two_positioned.dart';
import 'package:todo/sharedWidgets/icon_container.dart';


class AddTask extends StatefulWidget {
  AddTask({Key? key, required this.user}) : super(key: key);

  String user;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String? taskTitle;
  int? iconCodePoint, iconColor, conColor;
  String? date, time, notes;
  String? title = '';
  bool isComplete = false;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  DateTime? scheduleTime;
  DateTime? schedulePackedDate;
  TimeOfDay? schedulePackedTime;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child:
          BlocConsumer<AddTaskCubit, AddTaskStates>(listener: (context, state) {
        if (state is AddTaskLoading) {
          isLoading = true;
          setState(() {});
        }
        if (state is AddTaskFailure) {
          isLoading = false;
          showSnackBar(context, 'try again', "Add failed", ContentType.failure);
        }
        if (state is AddTaskSuccess) {
          setState(() {
            isLoading = false;
          });
          if (schedulePackedDate != null && schedulePackedTime != null) {
            String c =
                "${schedulePackedDate.toString().substring(0, 11)}${schedulePackedTime.toString().substring(10, 15)}:00.000";
            scheduleTime = DateTime.parse(c);
            NotificationServices().scheduleNotification(
                title: "$title",
                body: "your task time is now",
                time: scheduleTime!);
          }
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: CustomAppBar(
                height: 40.h,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const IconContainer(
                    icon: FontAwesomeIcons.xmark,
                    contColor: Colors.white,
                    iconColor: Color(0xff4A3780),
                    isSelected: false,
                  ),
                ),
                text: "Add New Task",
              ),
              body: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 843.4285714285714.h,
                    child: Stack(
                      children: [
                        const FirstPositioned(),
                        MainColorContainer(height: 100.h),
                        PositionedCircle(
                            left: -140.w,
                            top: -45.h,
                            width: 280.w,
                            height: 300.h),
                        PositionedCircle(
                            right: -100.w,
                            top: -45.h,
                            width: 180.w,
                            height: 180.h),
                        Positioned(
                          top: 120.h,
                          left: 20.w,
                          right: 20.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: const CustomText(
                                  text: "Task Title",
                                ),
                                subtitle: CustomTextField(
                                  borderColor: Colors.grey.withOpacity(0.4),
                                  validate: (data) {
                                    if (data!.isEmpty) {
                                      return "field is required";
                                    }
                                    return null;
                                  },
                                  hint: 'Task Title',
                                  obscure: false,
                                  fill: true,
                                  textColor: Colors.black,
                                  onchange: (data) {
                                    taskTitle = data;
                                    title = data;
                                    setState(() {});
                                  },
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
                                    controller: dateController,
                                    onTap: () async {
                                      var datePicked =
                                          await DatePicker.showSimpleDatePicker(
                                        backgroundColor: Colors.white,
                                        context,
                                        firstDate:
                                            DateTime(DateTime.now().year),
                                        lastDate: DateTime(2090),
                                        dateFormat: "dd-MMMM-yyyy",
                                        locale: DateTimePickerLocale.en_us,
                                        looping: true,
                                      );
                                      schedulePackedDate = datePicked;
                                      date =
                                          "${datePicked.toString().substring(8, 10)}-${datePicked.toString().substring(5, 7)}";
                                      if (datePicked != null) {
                                        dateController.text =
                                            "${datePicked.toString().substring(8, 10)}-${datePicked.toString().substring(5, 7)}";
                                      }
                                    },
                                    hint: 'Date',
                                    icon: const Icon(
                                      FontAwesomeIcons.calendar,
                                      color: Color(0xff4A3780),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  DateOrTimeWidget(
                                    controller: timeController,
                                    onTap: () async {
                                      final TimeOfDay? newTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(
                                            hour: DateTime.now().hour,
                                            minute: DateTime.now().minute),
                                      );
                                      schedulePackedTime = newTime;
                                      time =
                                          newTime.toString().substring(10, 15);
                                      if (newTime != null) {
                                        timeController.text = newTime
                                            .toString()
                                            .substring(10, 15);
                                      }
                                    },
                                    hint: 'Time',
                                    icon: const Icon(
                                      Icons.access_time,
                                      color: Color(0xff4A3780),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: const CustomText(text: "Notes"),
                                subtitle: CustomTextField(
                                  borderColor: Colors.grey.withOpacity(0.4),
                                  obscure: false,
                                  hint: 'Notes',
                                  maxLiens: 7,
                                  fill: true,
                                  textColor: Colors.black,
                                  onchange: (data) {
                                    notes = data;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 61.h,
                              ),
                              title != ''
                                  ? CustomButton(
                                      color: const Color(0xff4A3780),
                                      text: 'Add',
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          var task = TaskModel(
                                              taskTitle: taskTitle!,
                                              iconCodePoint: 0xe385,
                                              iconColor: 0xff194A66,
                                              conColor: 0xffDBECF6,
                                              notes: notes,
                                              time: time,
                                              date: date,
                                              isComplete: isComplete);
                                          BlocProvider.of<AddTaskCubit>(context)
                                              .addTask(task, taskTitle!,
                                                  widget.user);
                                        } else {
                                          autoValidateMode =
                                              AutovalidateMode.always;
                                        }
                                      })
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
