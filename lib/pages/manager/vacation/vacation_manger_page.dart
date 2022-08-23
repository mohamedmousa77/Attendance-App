import 'dart:async';

import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/moduls/manager_vacation.dart';
import 'package:attendance/pages/manager/vacation/vacation_details.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/manager/manager_vacation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VacationManager extends StatefulWidget {
  const VacationManager({Key? key}) : super(key: key);

  @override
  State<VacationManager> createState() => _VacationManagerState();
}

class _VacationManagerState extends State<VacationManager> {

  Widget getBody(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.85,

      child: FutureBuilder<List<ManagerVacation>>(
        future: Get.find<ManagerController>().fetchVacationRequestForManager(),
        builder: (BuildContext context,AsyncSnapshot<List<ManagerVacation>> snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              debugPrint('connection state is waiting Lost');
              return
                const  Center(child: CircularProgressIndicator());
            default:
              if(Get.find<ManagerController>().employeeVacationForManagerList.isNotEmpty){
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
                      itemCount: Get.find<ManagerController>().employeeVacationForManagerList.length,
                      itemBuilder: (_ , index ){
                        return GestureDetector(
                          onTap: () {
                            Get.to(VacationDetails(
                              managerVacation:
                              Get.find<ManagerController>().employeeVacationForManagerList[index],
                              listIndex: index,
                            ));
                          },
                          child: managerVacationCard(
                            context,
                           vacation:
                           Get.find<ManagerController>().employeeVacationForManagerList[index],
                            listIndex:  index,
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
      body: Column(
        children: [
          customerAppbar(context, 'VACATION'),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          getBody()
          //
          // isLoading
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     : Expanded(
          //         child: ListView.builder(
          //             itemCount: managerController.employeeVacationForManagerList.length,
          //             itemBuilder: (context, index) {
          //               return Column(
          //                 children: [
          //                   GestureDetector(
          //                     onTap: () {
          //                       Get.to(VacationDetails(
          //                        managerVacation: managerController
          //                            .employeeVacationForManagerList[index],
          //                         listIndex: index,
          //                       ));
          //                     },
          //                     child: managerVacationCard(
          //                       context,
          //                       ManagerVacation(
          //                         vacationId: managerController
          //                             .employeeVacationForManagerList[index].vacationId,
          //                           employeeName: managerController
          //                               .employeeVacationForManagerList[index]
          //                               .employeeName,
          //                           state: managerController
          //                               .employeeVacationForManagerList[index]
          //                               .state,
          //                           reason: managerController
          //                               .employeeVacationForManagerList[index]
          //                               .reason,
          //                           employeeTitle: managerController
          //                               .employeeVacationForManagerList[index]
          //                               .employeeTitle,
          //                           description: managerController
          //                               .employeeVacationForManagerList[index]
          //                               .description,
          //                           endDate: '',
          //                           startDate: managerController
          //                               .employeeVacationForManagerList[index]
          //                               .startDate),
          //                       index,
          //                       'VACATION',
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: MediaQuery.of(context).size.height * 0.02,
          //                   )
          //                 ],
          //               );
          //             }),
          //       ),
        ],
      ),
    );
  }
}
