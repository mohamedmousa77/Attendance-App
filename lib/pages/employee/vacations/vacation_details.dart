import 'package:attendance/moduls/permission.dart';
import 'package:attendance/moduls/vacation.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/employee_permission_details_card.dart';
import 'package:attendance/widgets/card/employee_vacation_details_card.dart';
import 'package:flutter/material.dart';

class EmployeeVacationDetails extends StatefulWidget {
  EmployeeVacationDetails(
      {Key? key, required this.employeeVacation, required this.listIndex})
      : super(key: key);
  Vacation employeeVacation;
  int listIndex;

  @override
  _EmployeePermissionDetailsState createState() =>
      _EmployeePermissionDetailsState();
}

class _EmployeePermissionDetailsState extends State<EmployeeVacationDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customerAppbar(context, 'PERMISSION REQUEST'),
            SizedBox(height: MediaQuery.of(context).size.height*0.06),
            employeeVacationDetails(context, widget.employeeVacation, widget.listIndex)
          ],
        ),
      ),
    );
  }
}
