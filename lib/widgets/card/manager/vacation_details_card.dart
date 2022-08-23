import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/moduls/manager_permission.dart';
import 'package:attendance/moduls/manager_vacation.dart';
import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../text_style.dart';

Widget managerVacationCardDetails(BuildContext context,
    {required ManagerVacation managerVacation,required int listIndex}){
  ManagerController managerController = ManagerController();
  return  Container(
    // height: MediaQuery.of(context).size.height*0.8,
    width:  MediaQuery.of(context).size.width*0.9,
    decoration: BoxDecoration(
        color:whiteColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow:[ BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0.5,
          blurRadius: 5,
          offset:const Offset(0, 3),
        )]

    ),
    child: Expanded(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05),
            height: MediaQuery.of(context).size.height*0.12,
            width:  MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
              color:const  Color.fromRGBO (236, 238, 244, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                const  CircleAvatar(
                  radius:30,
                  backgroundImage: AssetImage('assets/images/profile_avatar.png'),
                ),
                Container(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(managerVacation.employeeName,style: cardTitleStyle,),
                      Text(managerVacation.employeeTitle,style: inputFieldTitleStyle.copyWith(color:
                      const Color.fromRGBO (0, 20, 59, 1)),)
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        right:  MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.03,
                        top: MediaQuery.of(context).size.height * 0.015,
                      ),
                      margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.05,
                        // top: MediaQuery.of(context).size.height * 0.02,
                      ),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: managerVacation.state=='accepted'?MediaQuery.of(context).size.width * 0.23: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          color: managerVacation.state=='pending'? const Color.fromRGBO (255, 208, 54, 1):
                          managerVacation.state=='accepted'?primaryGreenColor_2:const Color.fromRGBO (246, 63, 63, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        managerVacation.state.toUpperCase(),
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Text('REASON',style:cardTitleStyle ) ,
                Text(managerVacation.reason,style:inputFieldTitleStyle ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Text('DATE',style:cardTitleStyle ) ,
                Text(managerVacation.startDate,style:inputFieldTitleStyle ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Text('DESCRIPTION',style:cardTitleStyle ) ,
                Text(managerVacation.description,style:inputFieldTitleStyle ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                managerVacation.state=='accepted'
                    ?Container():
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        managerController.updateVacationState(managerVacation,'accepted');
                        Get.back();
                        managerController.employeeVacationForManagerList.removeAt(listIndex);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05,
                        ),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: primaryGreenColor_2,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'ACCEPTED',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.02),
                            const  Icon(Icons.done,color: Colors.white, )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        managerController.updateVacationState(managerVacation,'reject');
                        Get.back();
                        managerController.employeePermissionForManagerList.removeAt(listIndex);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO (255, 100, 100, 1),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'REJECT',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.02),
                            const Icon(Icons.clear , color: Colors.white)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),


        ],
      ),
    ),
  );
}

