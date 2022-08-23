import 'dart:async';

import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/moduls/manager_report.dart';
import 'package:attendance/moduls/manager_vacation.dart';
import 'package:attendance/pages/manager/permission/permission_manager_page.dart';
import 'package:attendance/pages/manager/report/report_details.dart';
import 'package:attendance/pages/manager/report/report_manager_page.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/home_appbar.dart';
import 'package:attendance/widgets/card/home_card.dart';
import 'package:attendance/widgets/card/manager/manager_vacation_card.dart';
import 'package:attendance/widgets/card/manager/report_details.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/chat_controller.dart';
import '../../moduls/manager_permission.dart';
import '../../widgets/card/manager/manager_permission_card.dart';
import '../../widgets/card/manager/manager_report_card.dart';
import 'permission/permission_details.dart';

class ManagerHomePage extends StatefulWidget {
  const ManagerHomePage({Key? key}) : super(key: key);

  @override
  _ManagerHomePageState createState() => _ManagerHomePageState();
}

class _ManagerHomePageState extends State<ManagerHomePage>
    with TickerProviderStateMixin{
  // bool isLoading = true;

  late TabController _tabController ;
  late TabController tabControllerPermission ;
  late TabController _tabControllerReport;

  @override
  void initState() {
    // TODO: implement initState
    // Get.find<ManagerController>().fetchReportRequestForManager();
    // Get.find<ManagerController>().fetchPermissionRequestForManager();
    // Timer(
    //   const Duration(seconds: 3),
    //   () async {
    //     isDataLoading();
    //   },
    // );
    Get.find<ChatController>().fetchMessage();
    _tabControllerReport = TabController(
      initialIndex: 0,
      length: Get.find<ManagerController>().employeeReportForManagerList.length,
      vsync: this,
    );
    tabControllerPermission = TabController(
      initialIndex: 0,
      length: Get.find<ManagerController>().employeePermissionForManagerList.length,
      vsync: this,
    );
    _tabController = TabController(
      initialIndex: 0,
      length: 6,
      vsync: this,
    );
    super.initState();
  }

  // void isDataLoading() async{
  //   if (Get.find<ManagerController>().employeePermissionForManagerList.isEmpty &&
  //       Get.find<ManagerController>().employeeReportForManagerList.isEmpty ) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     debugPrint('is Loading');
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     _tabControllerRequest = TabController(
  //       initialIndex: 0,
  //       length: Get.find<ManagerController>().employeePermissionForManagerList.length,
  //       vsync: this,
  //     );
  //     _tabControllerReport = TabController(
  //       initialIndex: 0,
  //       length: Get.find<ManagerController>().employeeReportForManagerList.length,
  //       vsync: this,
  //     );
  //     debugPrint('is Loading');
  //   }
  //   SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
  //   setState(() {
  //     userName = sharedPreferences.getString('name')!;
  //     // userName.isNotEmpty?
  //     // isLoading = false:
  //     // isLoading = true;
  //   });
  // }

  List<String> managerOptions = [
    'PRESENT','DELAY','ABSENT'
    ,'managerVACATION','managerPERMISSIONS','managerREPORTS'
  ];
  Widget getAppbar(){
  return Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.34,
        left: MediaQuery.of(context).size.width * 0.04,
        right: MediaQuery.of(context).size.width * 0.04,
      ),
      child:TabBarView(
          controller: _tabController,
          children: List.generate(6, (index) {
            return homeCard(context, managerOptions[index]);
          },
          )
      )
  );
}
  Widget getBody () {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.width * 0.04,
                  // right: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Text(
                  'REQUESTS',
                  style: appbarTitleStyle.copyWith(
                      color: const Color.fromRGBO(0, 12, 46, 1)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const PermissionManager());
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.4,
                    // right: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: Text('SEE ALL',
                      style: inputFieldTitleStyle.copyWith(
                          color: primaryGreenColor_2 )),
                ),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.4,
            // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2,),
            child: FutureBuilder<List<ManagerPermission>>(
              future: Get.find<ManagerController>().fetchPermissionRequestForManager(),
              builder: (BuildContext context,AsyncSnapshot<List<ManagerPermission>> snapshot) {
                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                    debugPrint('connection state is waiting Lost');
                    return
                      const  Center(child: CircularProgressIndicator());
                  default:
                    if(Get.find<ManagerController>().employeePermissionForManagerList.isNotEmpty){
                      return Container(
                        // color: Colors.red,
                          height: MediaQuery.of(context).size.height * 0.32,
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: EdgeInsets.only(
                              bottom:  MediaQuery.of(context).size.height * 0.02),
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height*0.02,
                              left: MediaQuery.of(context).size.width*0.02,
                              right:  MediaQuery.of(context).size.width * 0.02),
                          child:
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Get.find<ManagerController>().employeePermissionForManagerList.length,
                            itemBuilder: (_ , index ){
                              return GestureDetector(
                                onTap: () {
                                  Get.to(PermissionDetails(
                                    permission: Get.find<ManagerController>().employeePermissionForManagerList[index],
                                    listIndex: index,
                                  ));
                                },
                                child: managerPermissionCard(
                                  context,
                                  Get.find<ManagerController>().employeePermissionForManagerList[index],
                                  index,
                                  'PERMISSION',
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
          ),
          Row(
            children: [
              Container(
                // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,),
                // height:  MediaQuery.of(context).size.height * 0.02,
                // width:  MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(
                  // top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Text(
                  'REPORTS',
                  style: appbarTitleStyle.copyWith(
                      color: const Color.fromRGBO(0, 12, 46, 1)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const ReportManagerPage());
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.4,
                    // right: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: Text('SEE ALL',
                      style: inputFieldTitleStyle.copyWith(
                          color: primaryGreenColor_2)),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.34,
            width: MediaQuery.of(context).size.width,
            child:
            FutureBuilder<List<ManagerReport>>(
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
                          height: MediaQuery.of(context).size.height * 0.32,
                          width: MediaQuery.of(context).size.width * 0.9,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height*0.02,
                              left: MediaQuery.of(context).size.width*0.02,
                              right:  MediaQuery.of(context).size.width * 0.02),
                          child:
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Get.find<ManagerController>().
                            employeeReportForManagerList.length,
                            itemBuilder: (_ , index ){
                              return GestureDetector(
                                onTap: () {
                                  Get.to(ReportDetails(
                                    employeeName: Get.find<ManagerController>()
                                        .employeeReportForManagerList[index]
                                        .employeeName,
                                    employeeJobTitle:  Get.find<ManagerController>()
                                        .employeeReportForManagerList[index]
                                        .employeeTitle,
                                    reportData:  Get.find<ManagerController>()
                                        .employeeReportForManagerList[index]
                                        .reportData,
                                    description:  Get.find<ManagerController>()
                                        .employeeReportForManagerList[index]
                                        .reportDescription,
                                  ));
                                },
                                child: managerReportCard(
                                    context,
                                    employeeJobTitle: Get.find<ManagerController>().
                                    employeeReportForManagerList[index].employeeTitle,
                                    employeeName:  Get.find<ManagerController>().
                                    employeeReportForManagerList[index].employeeName,
                                    reportData:  Get.find<ManagerController>().
                                    employeeReportForManagerList[index].reportData
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


            // ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: managerController
            //         .employeeReportForManagerList.length,
            //     itemBuilder: (context, index) {
            //       return Row(
            //         children: [
            //           GestureDetector(
            //             onTap: () {
            //               Get.to(ReportDetails(
            //                 employeeName: managerController
            //                     .employeeReportForManagerList[index]
            //                     .employeeName,
            //                 employeeJobTitle: managerController
            //                     .employeeReportForManagerList[index]
            //                     .employeeTitle,
            //                 reportData: managerController
            //                     .employeeReportForManagerList[index]
            //                     .reportData,
            //                 description: managerController
            //                     .employeeReportForManagerList[index]
            //                     .reportDescription,
            //
            //               ));
            //             },
            //             child: managerReportCard(
            //                 context,
            //                 'REPORT',
            //                 managerController
            //                     .employeeReportForManagerList[index]
            //                     .employeeName,
            //                 managerController
            //                     .employeeReportForManagerList[index]
            //                     .employeeTitle,
            //                 managerController
            //                     .employeeReportForManagerList[index]
            //                     .reportData),
            //           ),
            //           SizedBox(
            //               width:
            //                   MediaQuery.of(context).size.width * 0.06)
            //         ],
            //       );
            //     }),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                managerHomeAppbar(context),
                getAppbar()
              ],
            ),
            getBody ()
          ],
        ),
      ),
    );
  }

}
/*
TabBarView(
              controller: _tabControllerReport,
              children: List.generate(Get.find<ManagerController>()
                  .employeeReportForManagerList.length, (index) => GestureDetector(
                onTap: () {
                  Get.to(ReportDetails(
                    employeeName: Get.find<ManagerController>()
                        .employeeReportForManagerList[index]
                        .employeeName,
                    employeeJobTitle: Get.find<ManagerController>()
                        .employeeReportForManagerList[index]
                        .employeeTitle,
                    reportData: Get.find<ManagerController>()
                        .employeeReportForManagerList[index]
                        .reportData,
                    description: Get.find<ManagerController>()
                        .employeeReportForManagerList[index]
                        .reportDescription,

                  ));
                },
                child: managerReportCard(
                    context,
                    Get.find<ManagerController>()
                        .employeeReportForManagerList[index]
                        .employeeName,
                    Get.find<ManagerController>()
                        .employeeReportForManagerList[index]
                        .employeeTitle,
                    Get.find<ManagerController>()
                        .employeeReportForManagerList[index]
                        .reportData),
              )),
            )
 */
