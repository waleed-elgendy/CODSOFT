// ignore_for_file: use_build_context_synchronously


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/helper/show_snack_bar.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/register_page.dart';
import 'package:todo/sharedWidgets/custom_button.dart';
import 'package:todo/sharedWidgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, pass;
  bool passobsure = true, isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: const Color(0xff4A3780),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 20.h),
                  child: Image.asset('assets/logo.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TO",
                      style: TextStyle(color: Colors.white, fontSize: 50.sp),
                    ),
                    Text(
                      " DO",
                      style: TextStyle(
                          color: const Color(0xffEF7B45), fontSize: 50.sp),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.h, top: 80.h),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 30.sp),
                  ),
                ),
                CustomTextField(
                  validate: (data) {
                    if (data!.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                  onchange: (data) {
                    email = data;
                  },
                  obscure: false,
                  hint: "Enter your E-mail",
                  label: SizedBox(
                    width: 103.w,
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: 30.dm,
                        ),
                        Text(
                          "  E-mail",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
                        )
                      ],
                    ),
                  ),
                  textColor: Colors.white,
                  keyType: TextInputType.emailAddress,
                  fill: false,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  validate: (data) {
                    if (data!.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                  onchange: (data) {
                    pass = data;
                  },
                  hint: "Enter your Password",
                  label: SizedBox(
                    width: 135.w,
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 30.dm,
                        ),
                        Text(
                          "  Password",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                  obscure: passobsure,
                  suffix: InkWell(
                    highlightColor: const Color(0xffF8F8F8),
                    splashColor: const Color(0xffF8F8F8),
                    child: Icon(
                      passobsure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                        passobsure = !passobsure;
                      });
                    },
                  ),
                  fill: false,
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  text: "Login",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await loginUser();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                          return HomePage(
                            user: email!,
                          );
                        }), (route) => false);
                      } catch (e) {
                        showSnackBar(
                            context,
                            e == "A network error (such as timeout, interrupted connection or unreachable host) has occurred"
                                ? "Network Connection Error"
                                : "check email or password and try again");
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  color: Colors.white,
                  textColor: const Color(0xff4A3780),
                  hPadding: 80.w,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ));
                      },
                      child: Text(
                        " Register",
                        style: TextStyle(
                            color: const Color(0xffC7EDE6), fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: pass!);
  var token =  await FirebaseAuth.instance.currentUser!.getIdToken();
  print(token.toString());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token.toString());
    await prefs.setString('user', email!);
    print(email);
    }
}
