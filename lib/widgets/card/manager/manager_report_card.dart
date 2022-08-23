import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../theme/theme.dart';
import '../../text_style.dart';


Widget managerReportCard(BuildContext context,
    {required String employeeName,required String employeeJobTitle
      ,required String reportData}) {

  String dayNumber = DateFormat.d().format(DateTime.parse(reportData));
  String monthName = DateFormat.MMM().format(DateTime.parse(reportData)).toUpperCase();
  return Container(
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width*0.02,
        right: MediaQuery.of(context).size.width*0.02,
        bottom: MediaQuery.of(context).size.height*0.02),
    decoration: BoxDecoration(
        color:  whiteColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius:2,
            blurRadius: 5,
            offset: const Offset(5, 5),
          )
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          padding:
          EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(236, 238, 244, 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile_avatar.png'),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      employeeName,
                      style: cardTitleStyle,
                    ),
                    Text(
                      employeeJobTitle,
                      style: inputFieldTitleStyle,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.02 ),
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(4, 162, 174, 1),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),
                    SvgPicture.asset(
                      'assets/icons/permission_icon.svg',
                      height: 30,
                      color: Colors.white,
                    ),
                    Text(dayNumber, style: cardContentStyle),
                    Text(monthName,
                        style: cardContentStyle.copyWith(fontSize: 25)),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                'REPORT',
                style: cardTitleStyle,
              ),
            ],
          ),
        )
      ],
    ),
  );
}