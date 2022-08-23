import 'package:attendance/moduls/report.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/employee_report_details_card.dart';
import 'package:flutter/material.dart';

class EmployeeReportDetails extends StatelessWidget {
   EmployeeReportDetails({Key? key,
   required this.employeeReport,
     required this.listIndex
   }) : super(key: key);

  Report employeeReport ;
  int listIndex ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customerAppbar(context,'REPORT'),
          SizedBox(height: MediaQuery.of(context).size.height*0.04),
          employeeReportDetails(context,  employeeReport, listIndex)
        ],
      ),
    );
  }
}
