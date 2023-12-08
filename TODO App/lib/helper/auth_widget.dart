import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/login_page.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  String? token,user;
  bool initial = true;
  @override
  Widget build(BuildContext context) {
    if (initial) {
      SharedPreferences.getInstance().then((sharedPrefValue) {
        setState(() {
          initial = false;
          token = sharedPrefValue.getString('token');
          user = sharedPrefValue.getString('user');
        });
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else {
      if (token == null) {
        return const LoginPage();
    }else {
      return HomePage(user: user!);
    }
  }
}
}