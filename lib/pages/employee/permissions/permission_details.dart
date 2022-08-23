import 'package:attendance/moduls/permission.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/employee_permission_details_card.dart';
import 'package:flutter/material.dart';

class EmployeePermissionDetails extends StatefulWidget {
  EmployeePermissionDetails(
      {Key? key, required this.employeePermission, required this.listIndex})
      : super(key: key);
  Permission employeePermission;
  int listIndex;

  @override
  _EmployeePermissionDetailsState createState() =>_EmployeePermissionDetailsState();
}

class _EmployeePermissionDetailsState extends State<EmployeePermissionDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customerAppbar(context, 'PERMISSION REQUEST'),
            SizedBox(height: MediaQuery.of(context).size.height*0.06),
            employeePermissionDetails(context, widget.employeePermission, widget.listIndex)
          ],
        ),
      ),
    );
  }
}
