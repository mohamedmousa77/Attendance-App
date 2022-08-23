import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../text_style.dart';

Widget profileCard(BuildContext context, String cardTitle, int daysNum) {
  return Container(
    height: MediaQuery
        .of(context)
        .size
        .height * 0.25,
    width: MediaQuery
        .of(context)
        .size
        .width * 0.4,
    // margin: const EdgeInsets.only(top: 100, left: 75),
    decoration: BoxDecoration(
      color: primaryGreenColor_1,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery
                .of(context)
                .size
                .height * 0.03,
            bottom: MediaQuery
                .of(context)
                .size
                .height * 0.015,
          ),
          height: MediaQuery
              .of(context)
              .size
              .height * 0.125,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.3,
          child: SvgPicture.asset(
            'assets/icons/attendance_icon.svg',
          ),
        ),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.055),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.125,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.4,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cardTitle, style: profileTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$daysNum', style: profileTextStyle,),
                  cardTitle == 'Work'
                      ? Text(' days', style: profileTextStyle,)
                      : cardTitle == 'Vacation'
                      ? Text(' days', style: profileTextStyle,)
                      : cardTitle == 'Absent' ?Text(' days', style: profileTextStyle,):Container(),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
