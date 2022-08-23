import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/pages/employee/employee_home_page.dart';
import 'package:attendance/pages/manager/drawer_manager.dart';
import 'package:attendance/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../pages/chat_screen.dart';
import '../card/home_card.dart';
import '../text_style.dart';

Widget managerHomeAppbar (BuildContext context) {
  return Stack(
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: primaryGreenColor_1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.07,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(const DrawerManager()),
                      child: SvgPicture.asset(
                        'assets/icons/menu.svg',
                        color: Colors.white,
                      ),
                    ),

                    // GestureDetector(
                    //   onTap: ()=>Get.to(const HomeScreen()),
                    //   child: Row(
                    //     children: [
                    //       Text('Manager',style: appbarTitleStyle,),
                    //       SvgPicture.asset('assets/icons/reverse_icon.svg')
                    //     ],
                    //   ),
                    // ),
                    GestureDetector(
                      onTap:()=> Get.to(const ChatScreen()),
                      child: SvgPicture.asset(
                        'assets/icons/chat_icon1.svg',
                        width: 40,
                        height:40,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Text('Good morning,\n Mr. ${Get.find<ManagerController>().manager.name}',
                  style: appbarTitleStyle.copyWith(fontWeight: FontWeight.w300)),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Text('TODAY\'S ATTENDANCE' ,style: appbarTitleStyle,),
            )
          ],
        ),
      ),

    ],
  );
}
