import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../moduls/manager_permission.dart';
import '../../../theme/theme.dart';
import '../../text_style.dart';


Widget managerPermissionCard(BuildContext context,
    ManagerPermission permission, int listIndex, String title) {
  String dayNumber = DateFormat.d().format(DateTime.parse(permission.permissionData));
  String monthName = DateFormat.MMM().format(DateTime.parse(permission.permissionData)).toUpperCase();
  // String vacationState = 'PENDING';
  return Container(
    // height: MediaQuery.of(context).size.height * 0.35,
    // width: MediaQuery.of(context).size.width * 0.9,
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width*0.02,
        right: MediaQuery.of(context).size.width*0.02,
        bottom: MediaQuery.of(context).size.height*0.02),
    decoration: BoxDecoration(
        color:whiteColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: greyColor,
            spreadRadius:2,
            blurRadius: 5,
            offset: const Offset(5, 5),
          )
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding:
          EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            // const Color.fromRGBO(236, 238, 244, 1)
            color:ofWhiteColor,
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
                      permission.employeeName,
                      style: cardTitleStyle,
                    ),
                    Text(
                      permission.employeeTitle,
                      style: inputFieldTitleStyle,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02 ),
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  // const Color.fromRGBO(4, 162, 174, 1)
                  color:primaryGreenColor_1,
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
              Text(
                title,
                style: cardTitleStyle,
              ),
              Column(
                mainAxisAlignment: permission.state == 'accepted'
                    ? MainAxisAlignment.start
                    : permission.state == 'reject'
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.03,
                      left: MediaQuery.of(context).size.width * 0.03,
                      top: MediaQuery.of(context).size.height * 0.015,
                    ),
                    margin: EdgeInsets.only(
                      top: permission.state == 'accepted'
                          ? MediaQuery.of(context).size.height * 0.02
                          : permission.state == 'reject'
                          ? MediaQuery.of(context).size.height * 0.02
                          : 0,
                      right: MediaQuery.of(context).size.width * 0.05,
                      // top: MediaQuery.of(context).size.height * 0.02,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: permission.state == 'accepted'
                        ? MediaQuery.of(context).size.width * 0.23
                        : MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        color: permission.state == 'pending'
                            ? yellowColor
                            : permission.state == 'accepted'
                            ?trueColor
                            : waringColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      permission.state.toUpperCase(),
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              color: whiteColor,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  permission.state == 'pending'
                      ? Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(26, 185, 124, 1),
                      ),
                      child: const Icon(
                        Icons.done,
                        color: whiteColor,
                        size: 45,
                      ))
                      : Container(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  permission.state == 'pending'
                      ? SvgPicture.asset('assets/icons/cross.svg',
                      width: 35,
                      color: waringColor)
                      : Container(),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}