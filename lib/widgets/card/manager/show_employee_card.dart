import 'package:flutter/material.dart';

import '../../text_style.dart';


Widget showEmployeeCard(BuildContext context, String employeeName,String jobTitle) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.15,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35), color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        Container(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.02),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset('assets/images/profile_avatar.png')
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Text(employeeName, style: cardTitleStyle)),

                Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Text(jobTitle.toUpperCase(), style: inputFieldTitleStyle)),
              ],
            ),
          ],
        ),
      ],
    ),

  );
}