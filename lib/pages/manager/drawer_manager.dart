import 'dart:async';

import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/pages/manager/employees.dart';
import 'package:attendance/pages/manager/permission/permission_manager_page.dart';
import 'package:attendance/pages/manager/report/report_manager_page.dart';
import 'package:attendance/pages/manager/setting_manager.dart';
import 'package:attendance/pages/manager/vacation/vacation_manger_page.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/calendar/calendar_page.dart';
import '../profile_page.dart';
import '../splash_page.dart';
import 'manager_home_page.dart';

class DrawerManager extends StatefulWidget {
 const DrawerManager({Key? key}) : super(key: key);

  @override
  State<DrawerManager> createState() => _DrawerManagerState();
}

class _DrawerManagerState extends State<DrawerManager> {
  EmployeeController employeeController = EmployeeController();
  String userName = '';
  bool isLoading = true;
@override
  void initState() {
    // TODO: implement initState
  // employeeController.fetchDataEmployeeFromPreferences();
  // Timer(
  //   const Duration(seconds: 1),
  //       () async {
  //         // employeeController.fetchDataEmployeeFromPreferences();
  //         // getUserName();
  //   },
  // );
    super.initState();
  }
  // void getUserName()async{
  // SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
  // setState(() {
  //   userName = sharedPreferences.getString('name')!;
  //   userName.isNotEmpty?
  //   isLoading = false:
  //   isLoading = true;
  // });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGreenColor_1,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/cross.svg',
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                // onTap: () => Get.to(const ProfilePage()),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person-image.png'),
                  radius: 70,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Text(
               Get.find<ManagerController>().manager.name,
                  style: drawerTextStyle,
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home
                  GestureDetector(
                     onTap: ()=>Get.to(const ManagerHomePage()),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/home.svg',
                          color: const Color.fromRGBO(249, 248, 251, 1),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text("Home",
                            style: drawerTextStyle.copyWith(
                                color: const Color.fromRGBO(249, 248, 251, 1)))
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // Calender
                  GestureDetector(
                    onTap: () => Get.to(''),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          color: Colors.white,
                          height: 25,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text("Calender", style: drawerTextStyle)
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // Employees
                  GestureDetector(
                  onTap: ()=>Get.to(const EmployeePage()),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/visit_icon.svg',
                          color: Colors.white,
                          height: 25,
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                        Text("Employees", style: drawerTextStyle)
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //Attendance
                  GestureDetector(
                    // onTap: ()=>Get.to(const Attendance()),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/attendance_icon.svg',
                          color: Colors.white,
                          height: 25,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text("Attendance", style: drawerTextStyle)
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //permission
                  GestureDetector(
                    onTap: ()=>Get.to(const PermissionManager()),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/permission_icon.svg',
                          height: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text("Permissions", style: drawerTextStyle)
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //vacation
                  GestureDetector(
                    onTap: ()=>Get.to(const VacationManager()),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/attendance_icon.svg',
                          color: Colors.white,
                          height: 25,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text("Vacations", style: drawerTextStyle)
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //report
                  GestureDetector(
                 onTap: ()=>Get.to(const ReportManagerPage()),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/report_icon.svg',
                          color: Colors.white,
                          height: 25,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text("Reports", style: drawerTextStyle)
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //setting
                  GestureDetector(
                    onTap: () => Get.to(const ManagerSetting()),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/setting.svg',
                          color: Colors.white,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text("Sittings", style: drawerTextStyle)
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //log Out
                  GestureDetector(
                    onTap: () async{
                      employeeController.logOut();
                      Get.to(const SplashScreen());
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/logout.svg',
                          height: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text("Logout", style: drawerTextStyle)
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
