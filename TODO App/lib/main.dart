
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/cubits/view_tasks_cubit/view_tasks_cubit.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/helper/auth_widget.dart';
import 'package:todo/simple_bloc_observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLogIn=false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(411.42857142857144, 843.4285714285714),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {

          return BlocProvider(
            create: (context) => ViewTasksCubit(),
            child:  const MaterialApp(
              debugShowCheckedModeBanner: false,

              home:AuthWidget(),
            ),
          );
        });
  }
}
