import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/moduls/manager_permission.dart';
import 'package:attendance/moduls/permission.dart';
import 'package:attendance/moduls/report.dart';
import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../text_style.dart';

Widget employeeReportDetails(BuildContext context, Report employeeReport,int listIndex){

  return  Container(
    // height: MediaQuery.of(context).size.height*0.5,
    width:  MediaQuery.of(context).size.width*0.9,
    decoration: BoxDecoration(
        color:whiteColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow:[ BoxShadow(
          color: greyColor,
          spreadRadius: 0.5,
          blurRadius: 5,
          offset:const Offset(0, 3),
        )]

    ),
    child: Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left:MediaQuery.of(context).size.width*0.1,),
            height:MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: primaryGreenColor_1
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                SvgPicture.asset(
                  'assets/icons/report_icon.svg',
                    height: 50,
                ),
                SizedBox(width:MediaQuery.of(context).size.width*0.04),
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Today\'s work'.toUpperCase(),style: cardTitleStyle.copyWith(color: Colors.white),),
                      Text(DateFormat('dd MMM ,yyyy').format(DateTime.parse(employeeReport.time)),style: reportDetailsTextStyle.copyWith(color: Colors.white),),
                    ],
                  ),
                )
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

                Text(employeeReport.desc,style:inputFieldTitleStyle ),
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
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
        ],
      ),
    ),
  );
}

