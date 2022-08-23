import 'package:attendance/pages/employee/attendance_page.dart';
import 'package:attendance/pages/manager/permission/permission_manager_page.dart';
import 'package:attendance/pages/manager/vacation/vacation_manger_page.dart';
import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../pages/employee/permissions/permissions_page.dart';
import '../../pages/employee/reports/reports_page.dart';
import '../../pages/employee/vacations/vacations_page.dart';
import '../../pages/manager/report/report_manager_page.dart';
import '../text_style.dart';

Widget homeCard(BuildContext context, String cardTitle) {
  return GestureDetector(
    onTap: (){
      cardTitle == 'PERMISSIONS'
            ? Get.to(const EmployeePermissionPage())
          : cardTitle == 'ATTENDANCE'
          ?Get.to(const Attendance())
           : cardTitle == 'REPORTS'
          ? Get.to(const ReportPage())
          :cardTitle == 'VACATION'
          ?Get.to(const VacationPage())
          : cardTitle == 'managerPERMISSIONS'
          ?Get.to(const PermissionManager())
          :cardTitle == 'managerREPORTS'
          ?Get.to(const ReportManagerPage())
          :cardTitle == 'managerVACATION'
          ?Get.to(const VacationManager())
          :Get.to('');

    },
    child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            //CARD ICON
            Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.03,
                  left: MediaQuery.of(context).size.width * 0.02),
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: SvgPicture.asset(
                cardTitle == 'PRESENT'
                ?'assets/icons/attendance_icon.svg':
                cardTitle == 'DELAY'
                ?'assets/icons/attendance_icon.svg':
                cardTitle == 'ABSENT'
                ?'assets/icons/attendance_icon.svg':
                cardTitle == 'VACATION'
                ?'assets/icons/attendance_icon.svg'
                :cardTitle == 'managerVACATION'
                ?'assets/icons/attendance_icon.svg'
                : cardTitle == 'PERMISSIONS'
                ? 'assets/icons/permission_icon.svg'
                : cardTitle == 'managerPERMISSIONS'
                ?'assets/icons/permission_icon.svg'
                : cardTitle == 'ATTENDANCE'
                ? 'assets/icons/attendance_icon.svg'
                : cardTitle == 'REPORTS'
                ? 'assets/icons/report_icon.svg'
                :  cardTitle == 'managerREPORTS'
                ? 'assets/icons/report_icon.svg'
                : '',
                height: 30,
                color:
                cardTitle == 'PRESENT'?trueColor :
                cardTitle == 'ABSENT'?waringColor:
                cardTitle == 'DELAY'?yellowColor:
                cardTitle == 'VACATION'?primaryGreenColor_2
                    :cardTitle == 'VACATIONManager'
                    ?primaryGreenColor_2
                :
                cardTitle == 'PERMISSIONS'
                    ?primaryGreenColor_2
                :cardTitle == 'PERMISSIONSManager'?primaryGreenColor_2
                    : cardTitle == 'ATTENDANCE'
                        ? const Color.fromRGBO(237, 30, 84, 1)
                        : cardTitle == 'REPORTS'
                            ? const Color.fromRGBO(0, 43, 109, 1)
                            : const Color.fromRGBO(249, 143, 103, 1),
              ),
            ),
            //CARD TITLE
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.02,
                        ),
                        child: Text(
                            cardTitle == 'managerPERMISSIONS'
                                ?"PERMISSION"
                                :cardTitle =='managerREPORTS' ?'REPORT'
                            : cardTitle=='managerVACATION'?'VACATION'
                                :cardTitle, style: cardTitleStyle)),
                  ],
                ),
              ],
            ),
          ],
        ),
    ),
  );
}
