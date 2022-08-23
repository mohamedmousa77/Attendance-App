import 'dart:async';

import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/employee/primary_card_.dart';
import 'package:attendance/widgets/card/employee/permission_card.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../moduls/permission.dart';
import 'add_permission.dart';
import 'permission_details.dart';

class EmployeePermissionPage extends StatefulWidget {
  const EmployeePermissionPage({Key? key}) : super(key: key);

  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<EmployeePermissionPage> {
  Widget getBody(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.75,
      child: FutureBuilder<List<Permission>>(
        future: Get.find<EmployeeController>().fetchPermissionRequest(),
        builder: (BuildContext context,AsyncSnapshot<List<Permission>> snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              debugPrint('connection state is waiting');
              return const  Center(child: CircularProgressIndicator());
            default:
              if(Get.find<EmployeeController>().employeePermissionList.isNotEmpty){
                debugPrint('permission list '+Get.find<EmployeeController>().employeePermissionList.length.toString());
                return Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height*0.02,
                        left: MediaQuery.of(context).size.width*0.02,
                        right:  MediaQuery.of(context).size.width * 0.02),
                    child:
                    ListView.builder(
                      itemCount: Get.find<EmployeeController>().employeePermissionList.length,
                      itemBuilder: (_ , index ){
                        return GestureDetector(
                          onTap:(){
                            debugPrint('clicked');
                            Get.to(EmployeePermissionDetails(
                              employeePermission:  Get.find<EmployeeController>().employeePermissionList[index],
                              listIndex: index,
                            ));
                          },
                          child: permissionCard(context,
                            permissionState:   Get.find<EmployeeController>().employeePermissionList[index].state,
                            permissionData:   Get.find<EmployeeController>().employeePermissionList[index].date
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
          customerAppbar(context, 'PERMISSIONS'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const RequestPermission());
                },
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
          // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // isLoading
          // ? const Center(
          //   child: CircularProgressIndicator(),
          // )
          // : Expanded(
          //     child: ListView.builder(
          //         itemCount: employeeController.employeePermissionList.length,
          //         itemBuilder: (context, index) {
          //           return Column(
          //             children: [
          //               GestureDetector(
          //                 onTap: ()  {
          //                     Get.to(EmployeePermissionDetails(
          //                       listIndex: index,
          //                       employeePermission: employeeController.employeePermissionList[index],
          //                     ));
          //                 },
          //                 // onTap:(){
          //                 //   debugPrint('clicked');
          //                 //   Get.to(EmployeePermissionDetails(
          //                 //     listIndex: index,
          //                 //     employeePermission: employeeController.employeePermissionList[index],
          //                 //   ));
          //                 // },
          //                 child: permissionCard(
          //                     context,
          //                     employeeController
          //                         .employeePermissionList[index].time,
          //                     employeeController.employeePermissionList[index].state),
          //               ),
          //               SizedBox(height: MediaQuery.of(context).size.height*0.02)
          //             ],
          //           );
          //         })),

        ],
      ),
    );
  }
}
