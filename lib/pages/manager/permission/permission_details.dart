import 'package:attendance/moduls/manager_permission.dart';
import 'package:attendance/moduls/permission.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/manager/permission_details_card.dart';
import 'package:flutter/material.dart';

class PermissionDetails extends StatelessWidget {
  PermissionDetails(
      {Key? key, required this.listIndex, required  this.permission}) : super(key: key);
  ManagerPermission permission ;
  int listIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customerAppbar(context, 'PERMISSION REQUEST'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            managerPermissionDetails(
                context,
                ManagerPermission(
                  permissionId: permission.permissionId,
                    employeeName: permission.employeeName,
                    employeeTitle: permission.employeeTitle,
                    state: permission.state,
                    reason: permission.reason,
                    permissionData: permission.permissionData,
                    description: permission.description
                ),listIndex
            ),
          ],
        ),
      ),
    );
  }
}
