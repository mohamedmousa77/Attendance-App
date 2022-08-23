import 'package:attendance/pages/employee/client_visit_page.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import '../../../theme/theme.dart';

Widget
primaryCard(BuildContext context,{required String cardTitle,required String dayNumber}) {

  // greenColor, true, ''
  String _startTime = '8 : 00 ';
  String _endTime = '5 : 00';
  // String _dayNumber = ;
  String _monthName = 'NOV';

  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              color: cardTitle=='PRESENT'?greenColor:cardTitle=='ABSENT'?waringColor:yellowColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                SvgPicture.asset(
                  'assets/icons/attendance_icon.svg',
                  height: 30,
                ),
                Text(dayNumber, style: cardContentStyle),
                Text(_monthName,
                    style: cardContentStyle.copyWith(fontSize: 18)),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cardTitle, style: cardTitleStyle),
                  // isPresent
                  //     ? Row(
                  //   children: [
                  //     Text(_startTime,
                  //         style: cardTitleStyle.copyWith(
                  //             fontSize: 15, fontWeight: FontWeight.w200)),
                  //     const Icon(Icons.arrow_forward_outlined),
                  //     Text(_endTime,
                  //         style: cardTitleStyle.copyWith(
                  //             fontSize: 15, fontWeight: FontWeight.w200)),
                  //   ],
                  // )
                  //     : Container(),
                ],
              ),

            ],
          ),
        ],
      ),
    ),
  );
}





