import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/manager/report_details.dart';
import 'package:flutter/material.dart';


class ReportDetails extends StatelessWidget {
   ReportDetails({Key? key,
  required  this.employeeName,
    required  this.employeeJobTitle,
    required   this.reportData,
    required  this.description

  }) : super(key: key);
  String description = '';
  String employeeName = '';
  String employeeJobTitle = '';
  String reportData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customerAppbar(context,'REPORTS'),
          SizedBox(height:  MediaQuery.of(context).size.height*0.02,),
          managerReportDetails(context,
            description,employeeName,employeeJobTitle,reportData
          )
        ],
      ),
    );
  }
}

