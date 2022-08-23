import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/pages/employee/client_visit_page.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';



Widget reportCard(BuildContext context, {required String reportData}) {
  String _dayNumber = DateFormat.d().
  format(DateTime.parse(Get.find<EmployeeController>().employeeReportList.last.time));
  String _monthName = DateFormat.MMM().format(DateTime.parse(reportData)).toUpperCase();


  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.15,
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35), color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            color:primaryGreenColor_1,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              SvgPicture.asset(
                'assets/icons/report_icon.svg',
                height: 30,

              ),
              Text(_dayNumber, style: cardContentStyle),
              Text(_monthName,
                  style: cardContentStyle.copyWith(fontSize: 18)),
            ],
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('report'.toUpperCase(), style: cardTitleStyle),
              ],
            ),

          ],
        ),
      ],
    ),

  );
}