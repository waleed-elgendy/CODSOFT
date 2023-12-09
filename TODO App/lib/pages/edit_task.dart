// ignore_for_file: must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo/helper/show_snack_bar.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/sharedWidgets/custom_app_bar.dart';
import 'package:todo/sharedWidgets/custom_button.dart';
import 'package:todo/sharedWidgets/custom_text.dart';
import 'package:todo/sharedWidgets/custom_text_field.dart';
import 'package:todo/sharedWidgets/dateTime_widget.dart';
import 'package:todo/sharedWidgets/first_two_positioned.dart';
import 'package:todo/sharedWidgets/icon_container.dart';

class EditTask extends StatefulWidget {
   EditTask({Key? key, required this.user,required this.task}) : super(key: key);

  String user;
  TaskModel task;
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
 late String taskTitle;
  String? title = '';
  bool isComplete = false;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool isLoading = false;
  @override
  void initState() {
    taskTitle=widget.task.taskTitle;
    taskController.text=widget.task.taskTitle;
    dateController.text = widget.task.date == null? "": widget.task.date.toString();
    timeController.text= widget.task.time == null? "": widget.task.time.toString();
    notesController.text=widget.task.notes == null? "": widget.task.notes.toString();
    title=widget.task.taskTitle;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    CollectionReference deleteTasks =
    FirebaseFirestore.instance.collection(widget.user);
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
          showSnackBar(context, 'try again',"Edit failed",ContentType.failure);
        }
        if (state is AddTaskSuccess) {
          isLoading = false;
          setState(() {});
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar:CustomAppBar(
                height: 40.h,
                leading: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const IconContainer(
                    icon: FontAwesomeIcons.xmark,
                    contColor: Colors.white,
                    iconColor: Color(0xff4A3780),
                    isSelected: false,
                  ),
                ),
                text: "Edit your Task",
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
                            left: -140.w, top: -45.h, width: 280.w, height: 300.h),
                        PositionedCircle(
                            right: -100.w, top: -45.h, width: 180.w, height: 180.h),
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
                                  controller: taskController,
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
                                    widget.task.taskTitle=data!;
                                    title = data;
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              EditTaskIcon(task: widget.task),
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
                                        firstDate: DateTime(DateTime.now().year),
                                        lastDate: DateTime(2090),
                                        dateFormat: "dd-MMMM-yyyy",
                                        locale: DateTimePickerLocale.en_us,
                                        looping: true,
                                      );
                                      widget.task.date =
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
                                      final TimeOfDay? newTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(
                                            hour: DateTime.now().hour,
                                            minute: DateTime.now().minute),
                                      );
                                      widget.task.time = newTime.toString().substring(10, 15);
                                      if (newTime != null) {
                                        timeController.text =
                                            newTime.toString().substring(10, 15);
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
                                  controller: notesController,
                                  borderColor: Colors.grey.withOpacity(0.4),
                                  obscure: false,
                                  hint: 'Notes',
                                  maxLiens: 7,
                                  fill: true,
                                  textColor: Colors.black,
                                  onchange: (data) {
                                    widget.task.notes = data;
                                    notesController.text=data!;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 61.h,
                              ),
                              title != ''
                                  ? CustomButton(
                                  color: const Color(0xff4A3780),
                                  text: 'Save',
                                  onTap: () async{
                                    print(taskTitle);
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      var task = TaskModel(
                                          taskTitle: widget.task.taskTitle,
                                          iconCodePoint: widget.task.iconCodePoint,
                                          iconColor: widget.task.iconColor,
                                          conColor: widget.task.conColor,
                                          notes: widget.task.notes,
                                          time: widget.task.time,
                                          date: widget.task.date,
                                          isComplete: widget.task.isComplete

                                          );
                                      BlocProvider.of<AddTaskCubit>(context)
                                          .addTask(task, widget.task.taskTitle==taskTitle?taskTitle:widget.task.taskTitle, widget.user);
                                      if(widget.task.taskTitle!=taskTitle){
                                        await deleteTasks
                                            .doc(taskTitle)
                                            .delete();
                                      }
                                    } else {
                                      autoValidateMode = AutovalidateMode.always;
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
class EditTaskIcon extends StatefulWidget {
  const EditTaskIcon({Key? key, required this.task}) : super(key: key);

  final TaskModel task;
  @override
  State<EditTaskIcon> createState() => _EditTaskIconState();
}

class _EditTaskIconState extends State<EditTaskIcon> {
   late int currentIndex ;

    List<Color> contColors = const [
      Color(0xffDBECF6),
      Color(0xffE7E2F3),
      Color(0xffFEF5D3),
    ];
    List<Color> iconColors = const [
      Color(0xff194A66),
      Color(0xff4A3780),
      Color(0xff403100),
    ];
    List<IconData> icons = const [
      Icons.list_alt,
      Icons.event,
      Icons.emoji_events_outlined,
    ];

    @override
  void initState() {
    currentIndex=iconColors.indexOf(Color(widget.task.iconColor));
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return Row(
        children: [
          Text(
            "Category",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 25.w,
          ),
          SizedBox(
            width: 200.w,
            height: 60.h,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: iconColors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: GestureDetector(
                      onTap: () {
                        currentIndex = index;
                        BlocProvider.of<AddTaskCubit>(context).iconCodePoint =
                            icons[index].codePoint;
                        BlocProvider.of<AddTaskCubit>(context).iconColor =
                            iconColors[index].value;
                        BlocProvider.of<AddTaskCubit>(context).conColor =
                            contColors[index].value;
                        setState(() {});
                      },
                      child: IconContainer(
                        contColor: contColors[index],
                        icon: icons[index],
                        iconColor: iconColors[index],
                        isSelected: currentIndex == index,
                      ),
                    ),
                  );
                }),
          ),
        ],
      );
    }
  }
