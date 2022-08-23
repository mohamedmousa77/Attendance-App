import 'dart:async';

import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/pages/employee/vacations/add_vacation_request.dart';
import 'package:attendance/pages/employee/vacations/vacation_details.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/employee/permission_card.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../moduls/vacation.dart';
import '../../../widgets/card/employee/vacation_card.dart';


class VacationPage extends StatefulWidget {
  const VacationPage({Key? key}) : super(key: key);

  @override
  _VacationPageState createState() => _VacationPageState();
}

class _VacationPageState extends State<VacationPage> {
  Widget getBody(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.75,
      child: FutureBuilder<List<Vacation>>(
        future: Get.find<EmployeeController>().fetchVacationRequest(),
        builder: (BuildContext context,AsyncSnapshot<List<Vacation>> snapshot) {
          if(snapshot.connectionState ==  ConnectionState.waiting){
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/image/empty-image.svg'

              ),
            );
          }
          if(snapshot.hasData){
            debugPrint('snapShot has data');
            return Container(
                height: MediaQuery.of(context).size.height * 0.32,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.only(
                  // top: MediaQuery.of(context).size.height*0.02,
                    left: MediaQuery.of(context).size.width*0.02,
                    right:  MediaQuery.of(context).size.width * 0.02),
                child:
                ListView.builder(
                  itemCount: Get.find<EmployeeController>().employeeVacationList.length,
                  itemBuilder: (_ , index ){
                    return GestureDetector(
                      onTap:(){
                        debugPrint('clicked');
                        Get.to(EmployeeVacationDetails(
                          employeeVacation: Get.find<EmployeeController>().employeeVacationList[index],
                          listIndex: index,
                        ));
                      },
                      child: vacationCard(context,
                          vacationState:Get.find<EmployeeController>().employeeVacationList[index].state,
                          vacationData:Get.find<EmployeeController>().employeeVacationList[index].startDate
                      ),
                    );
                  },
                )
            );
          }
          return Container(
            height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: SvgPicture.asset('assets/image/empty-image.svg'

            ),
          );


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
            customerAppbar(context, 'VACATION'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const VacationRequest());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color:primaryGreenColor_1,
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
            //     ?const Center(
            //          child: CircularProgressIndicator(),
            // ) :
            // Expanded(
            //     child: ListView.builder(
            //         itemCount: Get.find<EmployeeController>().employeeVacationList.length,
            //         itemBuilder: (context, index) {
            //           // debugPrint( DateFormat.d().format( DateTime.parse( employeeController.employeeVacationList[index].startDate)));
            //           return Column(
            //             children: [
            //                GestureDetector(
            //                  onTap:(){
            //                 debugPrint('clicked');
            //                 Get.to(EmployeeVacationDetails(
            //                   employeeVacation: Get.find<EmployeeController>().employeeVacationList[index],
            //                   listIndex: index,
            //                 ));
            //                 },
            //                  child: vacationCard(context,
            //                      Get.find<EmployeeController>().employeeVacationList[index].state,
            //                      Get.find<EmployeeController>().employeeVacationList[index].startDate
            //                  ),
            //                ),
            //             SizedBox(height: MediaQuery.of(context).size.height*0.02)
            //             ],
            //           );
            //         })),
          ],
        ),

    );
  }
}
