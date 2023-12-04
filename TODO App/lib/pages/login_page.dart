import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
                  padding: const EdgeInsets.only(top: 20),
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
                    width: 101.w,
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: 30.dm,
                        ),
                        Text(
                          "  E-mail",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp),
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
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  color: Colors.white,
                  textColor: const Color(0xff4A3780),
                  width: 80.w,
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
}
