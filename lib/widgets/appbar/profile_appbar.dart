import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';

Widget profileAppBar(BuildContext context) {
  return Stack(
    children: [
      Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              // shape: BoxShape.circle,
              color: primaryGreenColor_1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(85),
                bottomRight: Radius.circular(85),
              )
            ),
          ),
          Container(
            // padding: EdgeInsets.only(top:  MediaQuery.of(context).size.height * 0.1,
            //   left:  MediaQuery.of(context).size.width * 0.1,),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: const BoxDecoration(
              // shape: BoxShape.circle,
              color: primaryGreenColor_1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(85),
                bottomRight: Radius.circular(85),
              )
            ),
          ),
        ],
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.2,
        left: MediaQuery.of(context).size.width * 0.4,
        child: Container(
          // padding: EdgeInsets.only(
          //   top: MediaQuery.of(context).size.height * 0.3,
          // ),
          child: const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/person-image.png'),
          ),
        ),
      )
    ],
    overflow: Overflow.visible,
  );
}
