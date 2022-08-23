import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/moduls/manager_permission.dart';
import 'package:attendance/moduls/permission.dart';
import 'package:attendance/moduls/vacation.dart';
import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../text_style.dart';

Widget employeeVacationDetails(BuildContext context,
    Vacation employeeVacation,int listIndex){
  DateTimeRange dateTimeRange =
  DateTimeRange(start: DateTime.parse(employeeVacation.startDate), end: DateTime.parse(employeeVacation.endDate));

  return  Container(
    // height: MediaQuery.of(context).size.height*0.5,
    width:  MediaQuery.of(context).size.width*0.9,
    padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width*0.02 ,
        top: MediaQuery.of(context).size.height*0.02),
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
    child:  Expanded(
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
                    color: employeeVacation.state=='pending'
                        ? const Color.fromRGBO (255, 208, 54, 1):
                    employeeVacation.state=='accepted'
                        ?const Color.fromRGBO (54, 255, 154, 1)
                        :const Color.fromRGBO (246, 63, 63, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  employeeVacation.state.toUpperCase(),
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
          Row(
            children: [
              Text('REASON',style:cardTitleStyle ) ,
              SizedBox(width: MediaQuery.of(context).size.width*0.04),
              Text(employeeVacation.reason,style:inputFieldTitleStyle ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Text('DESCRIPTION',style:cardTitleStyle ) ,
          // desc
          Container(
              margin:EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*0.05) ,
              child: Text(employeeVacation.desc,style:inputFieldTitleStyle )),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Row(
            children: [
              Text('Duration',style:cardTitleStyle ) ,
              SizedBox(width: MediaQuery.of(context).size.width*0.15),
              Text(dateTimeRange.duration.inDays.toString(),style:inputFieldTitleStyle ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          Row(
            children: [
              Container(
                  child: Column(
                children: [
                  Text('Start Day',style:cardTitleStyle ),
                  Text(employeeVacation.startDate,style:inputFieldTitleStyle ),
                ],
              )),
              SizedBox(width: MediaQuery.of(context).size.width*0.1),
              Container(
                  child: Column(
                    children: [
                      Text('End Day',style:cardTitleStyle ) ,
                      Text(employeeVacation.endDate,style:inputFieldTitleStyle ),
                    ],
                  )) ,
            ],
          ) ,
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
  );
}

