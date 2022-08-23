import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/moduls/manager_permission.dart';
import 'package:attendance/moduls/permission.dart';
import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../text_style.dart';

Widget employeePermissionDetails(BuildContext context,
    Permission employeePermission,int listIndex){

  return  Container(
    // height: MediaQuery.of(context).size.height*0.5,
    width:  MediaQuery.of(context).size.width*0.9,
    decoration: BoxDecoration(
        color:const  Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(50),
        boxShadow:[ BoxShadow(
          color: greyColor,
          spreadRadius: 0.5,
          blurRadius: 5,
          offset:const Offset(0, 3),
        )]

    ),
    child: Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.02),
        Container(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
          child: Expanded(
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
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                          color: employeePermission.state=='pending'
                              ? const Color.fromRGBO (255, 208, 54, 1):
                          employeePermission.state=='accepted'
                              ?const Color.fromRGBO (54, 255, 154, 1)
                              :const Color.fromRGBO (246, 63, 63, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        employeePermission.state.toUpperCase(),
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
                Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                    child: Text(employeePermission.reason,style:inputFieldTitleStyle )),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Text('DATE',style:cardTitleStyle ) ,
                Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                    child: Text(DateFormat.yMMMd().format(DateTime.parse(employeePermission.time)),style:inputFieldTitleStyle )),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Text('DESCRIPTION',style:cardTitleStyle ) ,
                Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                    child: Text(employeePermission.desc,style:inputFieldTitleStyle )),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05,
                          // top: MediaQuery.of(context).size.height * 0.02,
                        ),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'DELETE',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO (255, 100, 100, 1),
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: BoxDecoration(
                            color: primaryGreenColor_1,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'EDIT',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02),
              ],
            ),
          ),
        ),


      ],
    ),
  );
}

