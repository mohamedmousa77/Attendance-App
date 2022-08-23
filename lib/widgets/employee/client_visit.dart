import 'package:attendance/pages/employee/client_visit_page.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';



Widget clientVisitCard(BuildContext context, String cardTitle) {
  String _dayNumber = '27';
  String _monthName = 'NOV';

  return  GestureDetector(
    // onTap: ()=>Get.to(const ClientVisit()),
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
              color: const Color.fromRGBO(249, 143, 103, 1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                SvgPicture.asset(
                  'assets/icons/visit_icon.svg',
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
                  Text(cardTitle, style: cardTitleStyle),
                ],
              ),

            ],
          ),
        ],
      ),
    ),

  );
}