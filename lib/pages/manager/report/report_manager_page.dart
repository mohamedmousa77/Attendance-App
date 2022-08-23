import 'dart:async';

import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/pages/manager/report/report_details.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/manager/manager_vacation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../moduls/manager_report.dart';
import '../../../widgets/card/manager/manager_report_card.dart';

class ReportManagerPage extends StatefulWidget {
  const ReportManagerPage({Key? key}) : super(key: key);

  @override
  _ReportManagerPageState createState() => _ReportManagerPageState();
}

class _ReportManagerPageState extends State<ReportManagerPage> {
  // ManagerController managerController = ManagerController();
  // bool isLoading = true;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Timer(
  //     const Duration(seconds: 1),
  //         () async {
  //
  //           isDateLoading();
  //     },
  //   );
  //   managerController.fetchReportRequestForManager();
  //   super.initState();
  // }
  // void isDateLoading(){
  //   setState(() {
  //     managerController.employeeReportForManagerList.isEmpty
  //         ?isLoading = true
  //         :isLoading = false;
  //   });
  //
  // }
  Widget getBody(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.85,

      child: FutureBuilder<List<ManagerReport>>(
        future: Get.find<ManagerController>().fetchReportRequestForManager(),
        builder: (BuildContext context,AsyncSnapshot<List<ManagerReport>> snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              debugPrint('connection state is waiting Lost');
              return
                const  Center(child: CircularProgressIndicator());
            default:
              if(Get.find<ManagerController>().employeeReportForManagerList.isNotEmpty){
                return Container(
                  // color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height*0.02,
                        left: MediaQuery.of(context).size.width*0.02,
                        right:  MediaQuery.of(context).size.width * 0.02),
                    child:
                    ListView.builder(
                      itemCount: Get.find<ManagerController>().employeeReportForManagerList.length,
                      itemBuilder: (_ , index ){
                        return GestureDetector(
                          onTap: () {
                            Get.to(ReportDetails(
                              description:Get.find<ManagerController>().employeeReportForManagerList[index].reportDescription ,
                              employeeJobTitle:Get.find<ManagerController>().employeeReportForManagerList[index].employeeTitle ,
                              employeeName: Get.find<ManagerController>().employeeReportForManagerList[index].employeeName,
                              reportData: Get.find<ManagerController>().employeeReportForManagerList[index].reportData,
                            ));
                          },
                          child: managerReportCard(
                            context,
                            reportData:Get.find<ManagerController>().employeeReportForManagerList[index].reportData ,
                            employeeJobTitle: Get.find<ManagerController>().employeeReportForManagerList[index].employeeTitle,
                            employeeName: Get.find<ManagerController>().employeeReportForManagerList[index].employeeName,
                          ),
                        );
                      },
                    )
                );
              }else {
                return Container();
              }
          }
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:whiteColor,
      body:  Column(
        children: [
          customerAppbar(context,'REPORTS'),
          getBody()

          // Expanded(
          //   child: ListView.builder(
          //       itemCount: managerController.employeeReportForManagerList.length,
          //       itemBuilder: (context, index) {
          //         return Column(
          //           children: [
          //             GestureDetector(
          //               onTap:(){
          //                 Get.to(ReportDetails(
          //                   employeeName:  Get.find<ManagerController>()
          //                       .employeeReportForManagerList[index]
          //                       .employeeName,
          //                   employeeJobTitle:  Get.find<ManagerController>()
          //                       .employeeReportForManagerList[index]
          //                       .employeeTitle,
          //                   reportData:  Get.find<ManagerController>()
          //                       .employeeReportForManagerList[index]
          //                       .reportData,
          //                   description:  Get.find<ManagerController>()
          //                       .employeeReportForManagerList[index]
          //                       .reportDescription,
          //                 ));
          //               },
          //               child: managerReportCard(context,
          //                  employeeName:  managerController.employeeReportForManagerList[index].employeeName,
          //                employeeJobTitle:    managerController.employeeReportForManagerList[index].
          //                employeeTitle,
          //                reportData:  managerController.employeeReportForManagerList[index].reportData
          //               ),
          //             ),
          //             SizedBox(height: MediaQuery.of(context).size.height*0.02,)
          //           ],
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}
