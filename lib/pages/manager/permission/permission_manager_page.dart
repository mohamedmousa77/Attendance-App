import 'dart:async';

import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/moduls/manager_vacation.dart';
import 'package:attendance/pages/manager/permission/permission_details.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/manager/manager_vacation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../moduls/manager_permission.dart';
import '../../../widgets/card/manager/manager_permission_card.dart';

class PermissionManager extends StatefulWidget {
  const PermissionManager({Key? key}) : super(key: key);

  @override
  _PermissionManagerState createState() => _PermissionManagerState();
}

class _PermissionManagerState extends State<PermissionManager> {

  Widget getBody(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.85,
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
                    // padding: EdgeInsets.only(
                    //     bottom:  MediaQuery.of(context).size.height * 0.02),
                    margin: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height*0.02,
                        left: MediaQuery.of(context).size.width*0.02,
                        right:  MediaQuery.of(context).size.width * 0.02),
                    child:
                    ListView.builder(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:whiteColor,
      body:  Column(
        children: [
          customerAppbar(context,'PERMISSIONS'),
          getBody()
        ],
      ),
    );
  }
}
/*
 ListView.builder(
                itemCount: Get.find<ManagerController>().employeePermissionForManagerList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.to(PermissionDetails(
                            permission:Get.find<ManagerController>().employeePermissionForManagerList[index],
                            listIndex: index,
                          ));
                        },
                        child: managerPermissionCard(
                          context,
                          Get.find<ManagerController>().employeePermissionForManagerList[index],
                          index,
                          'PERMISSION',
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,)
                    ],
                  );
                })
 */