import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/widgets/appbar/profile_appbar.dart';
import 'package:attendance/widgets/card/profile_card.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final EmployeeController _employeeController = EmployeeController();
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
                  Text(Get.find<EmployeeController>().employee.name,style: profileTextStyle.copyWith(fontSize: 19),),
                  SizedBox(width:  MediaQuery.of(context).size.width*0.02),
                  // Text(lastName,style: profileTextStyle.copyWith(fontSize: 19),),
                ]
            ),
            SizedBox(height:  MediaQuery.of(context).size.height*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                profileCard(context,'Work',Get.find<EmployeeController>().employee.workDays),
                SizedBox(width:  MediaQuery.of(context).size.width*0.05),
                profileCard(context,'Vacation',Get.find<EmployeeController>().employee.vacationDays),
              ],
            ),
            SizedBox(height:  MediaQuery.of(context).size.height*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                profileCard(context,'Absent' , Get.find<EmployeeController>().employee.absentDays),
                SizedBox(width:  MediaQuery.of(context).size.width*0.05),
                profileCard(context,'Permissions' , Get.find<EmployeeController>().employee.permission),
              ],
            ),
            SizedBox(height:  MediaQuery.of(context).size.height*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width:  MediaQuery.of(context).size.width*0.07),
                profileCard(context,'Report' ,Get.find<EmployeeController>().employee.report),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
