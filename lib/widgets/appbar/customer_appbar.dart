import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../text_style.dart';

Container customerAppbar (BuildContext context , String appbarTitle){
  return Container(
    height: MediaQuery.of(context).size.height * 0.15,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(55),
        bottomRight: Radius.circular(55),
      ),
      color: primaryGreenColor_1
      // gradient: LinearGradient(
      //     begin: Alignment.topRight,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       primaryGreenColor_2,
      //       primaryGreenColor_1,
      //     ]),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.06,
            left: MediaQuery.of(context).size.width * 0.05,
          ),
          child: IconButton(
            icon:
            const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 35),
            onPressed: () =>Get.back(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.07,
            left: MediaQuery.of(context).size.width * 0.09,
          ),
          child: Text(appbarTitle, style: appbarTitleStyle),
        ),
      ],
    ),
  );
}

