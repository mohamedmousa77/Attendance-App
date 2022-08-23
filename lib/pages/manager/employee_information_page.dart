import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/moduls/employee.dart';
import 'package:attendance/widgets/appbar/profile_appbar.dart';
import 'package:attendance/widgets/card/profile_card.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class EmployeeInfoPage extends StatefulWidget {
  EmployeeInfoPage({Key? key ,
  required this.employee
  }) : super(key: key);
  Employee employee ;

  @override
  _ProfilePageState createState() => _ProfilePageState(employee: employee);
}

class _ProfilePageState extends State<EmployeeInfoPage> {
  // final EmployeeController _employeeController = EmployeeController();
  Employee employee;
  _ProfilePageState({
    required this.employee});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _employeeController.fetchData();
    // _employeeController.fetchVacationRequest();
    // _employeeController.fetchDataEmployeeFromPreferences();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileAppBar(context),
            SizedBox(height:  MediaQuery.of(context).size.height*0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(employee.name,style: profileTextStyle.copyWith(fontSize: 19),),
                  SizedBox(width:  MediaQuery.of(context).size.width*0.02),
                  // Text(lastName,style: profileTextStyle.copyWith(fontSize: 19),),
                ]
            ),
            SizedBox(height:  MediaQuery.of(context).size.height*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                profileCard(context,'Work',employee.workDays),
                SizedBox(width:  MediaQuery.of(context).size.width*0.05),
                profileCard(context,'Vacation',employee.vacationDays),
              ],
            ),
            SizedBox(height:  MediaQuery.of(context).size.height*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                profileCard(context,'Absent' , employee.absentDays),
                SizedBox(width:  MediaQuery.of(context).size.width*0.05),
                profileCard(context,'Permissions' , employee.permission),
              ],
            ),
            SizedBox(height:  MediaQuery.of(context).size.height*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width:  MediaQuery.of(context).size.width*0.07),
                profileCard(context,'Report' ,employee.report),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
