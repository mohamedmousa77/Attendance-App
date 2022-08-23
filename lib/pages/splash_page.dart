import 'dart:async';

import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'employee/employee_home_page.dart';
import 'login_page.dart';
import 'manager/manager_home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// EmployeeController employeeController = EmployeeController();
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 3),
          () async {
      await  Get.find<EmployeeController>().autoLogin()
          ? Get.find<EmployeeController>().employee.userType
          ?Get.off(const HomeScreen())
      :Get.off(const ManagerHomePage())

      :  Get.off(const LoginPage());
        },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGreenColor_1,
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.3,
        ),
        child: Text('ATTENDANCE \n    APPLICATION',style: appbarTitleStyle.copyWith(fontWeight: FontWeight.w200),),
      ),
    );
  }
}
