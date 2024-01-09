import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/sharedWidgets/icon_container.dart';

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