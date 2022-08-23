import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/pages/employee/employee_home_page.dart';
import 'package:attendance/pages/employee/reports/reports_page.dart';
import 'package:attendance/pages/profile_page.dart';
import 'package:attendance/pages/splash_page.dart';
import 'package:attendance/pages/employee/vacations/vacations_page.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/calendar/calender_screen.dart';
import 'attendance_page.dart';
import 'client_visit_page.dart';
import 'permissions/permissions_page.dart';

class DrawerPage extends StatelessWidget {
   DrawerPage({Key? key}) : super(key: key);

  // EmployeeController employeeController = EmployeeController();

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
                onTap: () => Get.to(const ProfilePage()),
                child: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/person-image.png'),
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
                    Get.find<EmployeeController>().employee.name,
                    style: drawerTextStyle,
                  ),)
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: ()=>Get.to(const HomeScreen()),
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        SvgPicture.asset(
                          'assets/icons/home.svg',
                          color:const Color.fromRGBO (249, 248, 251, 1),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Text("Home", style: drawerTextStyle.copyWith(color: const Color.fromRGBO (249, 248, 251, 1)))
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  GestureDetector(
                    onTap: ()=>Get.to( CalenderScreen()),
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
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  GestureDetector(
                    onTap: ()=>Get.to(const Attendance()),
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
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  // GestureDetector(
                  //   onTap: ()=>Get.to(const ClientVisit()),
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //           width: MediaQuery.of(context).size.width * 0.05),
                  //       SvgPicture.asset(
                  //         'assets/icons/visit_icon.svg',
                  //         color: Colors.white,
                  //         height: 25,
                  //       ),
                  //       SizedBox(
                  //           width: MediaQuery.of(context).size.width * 0.02),
                  //       Text("Client visits", style: drawerTextStyle)
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  GestureDetector(
                    onTap: ()=>Get.to(const EmployeePermissionPage()),
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
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  GestureDetector(
                    onTap: ()=>Get.to(const VacationPage()),
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
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  GestureDetector(
                    onTap: ()=>Get.to(const ReportPage()),
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
                  // SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  // GestureDetector (
                  //   onTap: ()=>Get.to('page'),
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //           width: MediaQuery.of(context).size.width * 0.05),
                  //       SvgPicture.asset(
                  //         'assets/icons/setting.svg',
                  //         color: Colors.white,
                  //       ),
                  //       SizedBox(
                  //           width: MediaQuery.of(context).size.width * 0.02),
                  //       Text("Sittings", style: drawerTextStyle)
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  GestureDetector(
                    onTap: (){
                      Get.find<EmployeeController>().logOut();
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
