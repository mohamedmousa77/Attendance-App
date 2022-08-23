import 'package:attendance/moduls/manager_permission.dart';
import 'package:attendance/moduls/manager_vacation.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/manager/manager_vacation_card.dart';
import 'package:attendance/widgets/card/manager/permission_details_card.dart';
import 'package:attendance/widgets/card/manager/vacation_details_card.dart';
import 'package:flutter/material.dart';

class VacationDetails extends StatelessWidget {
  VacationDetails(
      {Key? key, required this.managerVacation, required this.listIndex,})
      : super(key: key);
  ManagerVacation managerVacation;
  int listIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customerAppbar(context, 'VACATION REQUEST'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            managerVacationCardDetails(
                context,
              managerVacation:   ManagerVacation(
                  vacationId: managerVacation.vacationId,
                    employeeName: managerVacation.employeeName,
                    employeeTitle: managerVacation.employeeTitle,
                    state: managerVacation.state,
                    reason: managerVacation.reason,
                    startDate: managerVacation.startDate,
                    description: managerVacation.description,
                    endDate: managerVacation.endDate),
            listIndex:   listIndex,
            ),
          ],
        ),
      ),
    );
  }
}
