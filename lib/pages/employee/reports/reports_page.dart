import 'dart:async';

import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/pages/employee/reports/report_details.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/employee/primary_card_.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../moduls/report.dart';
import '../../../widgets/card/employee/report_card.dart';
import 'add_report.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  // // EmployeeController employeeController = EmployeeController();
  // bool isLoading = true;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // Get.find<EmployeeController>().fetchDataEmployeeFromPreferences();
  //   Get.find<EmployeeController>().fetchReports();
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 1),
  //     () async {
  //       // Get.find<EmployeeController>().fetchDataEmployeeFromPreferences();
  //       getUserData();
  //     },
  //   );
  // }
  //
  // void getUserData() async {
  //   setState(() {
  //     Get.find<EmployeeController>().employeeReportList.isNotEmpty
  //         ? isLoading = false
  //         : isLoading = true;
  //   });
  // }

  Widget getBody(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.75,
      child: FutureBuilder<List<Report>>(
        future: Get.find<EmployeeController>().fetchReports(),
        builder: (BuildContext context,AsyncSnapshot<List<Report>> snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              debugPrint('connection state is waiting');

              return
                const  Center(child: CircularProgressIndicator());
            default:
              if(Get.find<EmployeeController>().employeeReportList.isNotEmpty){
                debugPrint('report list '+Get.find<EmployeeController>().employeeReportList.length.toString());
                return Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height*0.02,
                        left: MediaQuery.of(context).size.width*0.02,
                        right:  MediaQuery.of(context).size.width * 0.02),
                    child:
                    ListView.builder(
                      itemCount: Get.find<EmployeeController>().employeeReportList.length,
                      itemBuilder: (_ , index ){
                        return GestureDetector(
                          onTap:(){
                            debugPrint('clicked');
                            Get.to(EmployeeReportDetails(
                              listIndex: index,
                               employeeReport: Get.find<EmployeeController>().employeeReportList[index],

                            ));
                          },
                          child: reportCard(context,
                           reportData: Get.find<EmployeeController>().employeeReportList[index].time
                          ),
                        );
                      },
                    )
                );
              }
              else {
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
      backgroundColor: ofWhiteColor,
      body: Column(
        children: [
          customerAppbar(context, 'REPORTS'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // add new report
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Get.to(const NewReport()),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      color: primaryGreenColor_1,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset('assets/icons/add.svg'),
                      Text(
                        'ADD NEW',
                        style: buttonTitleStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          getBody()
          // isLoading
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     : Expanded(
          //         child: ListView.builder(
          //             itemCount: Get.find<EmployeeController>().employeeReportList.length,
          //             itemBuilder: (context, index) {
          //               return Column(
          //                 children: [
          //                   GestureDetector(
          //                     onTap: () {
          //                       debugPrint('clicked');
          //                       Get.to(EmployeeReportDetails(
          //                         listIndex: index,
          //                         employeeReport: Get.find<EmployeeController>().employeeReportList[index],
          //                       ));
          //                     },
          //                     child: reportCard(
          //                         context,
          //                         'REPORT',
          //                         Get.find<EmployeeController>()
          //                             .employeeReportList[index].time),
          //                   ),
          //                   SizedBox(
          //                       height:
          //                           MediaQuery.of(context).size.height * 0.02)
          //                 ],
          //               );
          //             })),
        ],
      ),
    );
  }
}
