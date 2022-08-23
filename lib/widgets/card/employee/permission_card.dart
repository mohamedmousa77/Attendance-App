import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../text_style.dart';

Widget permissionCard(BuildContext context,
    {required String permissionData,required String permissionState}) {
  String _dayNumber = DateFormat.d().format(DateTime.parse(permissionData));
  String _monthName = DateFormat.MMM().format(DateTime.parse(permissionData)).toUpperCase();
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.15,
    margin: EdgeInsets.only(bottom:  MediaQuery.of(context).size.height * 0.02),

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
            color: primaryGreenColor_1,
            // const Color.fromRGBO(38, 70, 83, 1)
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              SvgPicture.asset(
                'assets/icons/permission_icon.svg',
                height: 30,
              ),
              Text(_dayNumber, style: cardContentStyle),
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
                Text('PERMISSION', style: cardTitleStyle),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                top: MediaQuery.of(context).size.height * 0.015,
              ),
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                  color: permissionState == 'pending'
                      ? yellowColor
                      : permissionState == 'reject'
                      ?waringColor
                      : const Color.fromRGBO(54, 255, 154, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                permissionState.toUpperCase(),
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
