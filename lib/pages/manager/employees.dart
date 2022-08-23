import 'dart:async';

import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/manager/show_employee_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'employee_information_page.dart';


class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  ManagerController managerController = ManagerController();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    managerController.fetchAllEmployeesData();
    Timer(
      const Duration(seconds: 2),
          () async {
        isDateLoading();
      },
    );
    super.initState();
  }

  void isDateLoading() {
    setState(() {
      managerController.employeeDataList.isEmpty
          ? isLoading = true
          : isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 248, 251, 1),
      body: Column(
        children: [
          customerAppbar(context, 'EMPLOYEES'),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.02,),
          isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          ) :
          Expanded(
            child: ListView.builder(
                itemCount: managerController.employeeDataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint('clicked');
                          Get.to(EmployeeInfoPage(employee: managerController
                              .employeeDataList[index]));
                        },
                        child: showEmployeeCard(context,
                            managerController.employeeDataList[index].name,
                            managerController.employeeDataList[index]
                                .jobTitle),
                      ),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.02)
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
