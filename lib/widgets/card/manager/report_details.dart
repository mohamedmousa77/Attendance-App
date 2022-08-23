import 'package:flutter/material.dart';

import '../../text_style.dart';

Widget managerReportDetails(
  BuildContext context,
  String description,
  String employeeName,
  String employeeJobTitle,
  String permissionData,
) {
  return Container(
    // height: MediaQuery.of(context).size.height*0.5,
    width: MediaQuery.of(context).size.width * 0.9,
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ]),
    child: Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                        style: inputFieldTitleStyle.copyWith(
                            color: const Color.fromRGBO(0, 20, 59, 1)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
          Container(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // (11, 81, 145, 1)
                Text(
                  'TODAY\'S WORK',
                  style: cardTitleStyle.copyWith(
                      color: const Color.fromRGBO(11, 81, 145, 1)),
                ),
                Text(permissionData, style: reportDetailsTextStyle),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(description, style: inputFieldTitleStyle)
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ],
      ),
    ),
  );
}

// class ManagerReportCardDetails extends StatelessWidget {
//    ManagerReportCardDetails(
//       {Key? key,
//     required  this.employeeName,
//     required  this.employeeJobTitle,
//    required   this.permissionData,
//     required  this.description
//
//       })
//       : super(key: key);
//   String description = '';
//   String employeeName = '';
//   String employeeJobTitle = '';
//   String permissionData = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height*0.5,
//           width:  MediaQuery.of(context).size.width*0.9,
//           decoration: BoxDecoration(
//               color:const  Color.fromRGBO(255, 255, 255, 1),
//               borderRadius: BorderRadius.circular(50),
//               boxShadow:[ BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 0.5,
//                 blurRadius: 5,
//                 offset:const Offset(0, 3),
//               )]
//
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05),
//                 height: MediaQuery.of(context).size.height*0.12,
//                 width:  MediaQuery.of(context).size.width*0.9,
//                 decoration: BoxDecoration(
//                   color:const  Color.fromRGBO (236, 238, 244, 1),
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 child: Row(
//                   children: [
//                     const  CircleAvatar(
//                       radius:30,
//                       backgroundImage: AssetImage('assets/images/profile_avatar.png'),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(employeeName,style: cardTitleStyle,),
//                           Text(employeeJobTitle,style: inputFieldTitleStyle.copyWith(color: const Color.fromRGBO (0, 20, 59, 1)),)
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height*0.05,),
//               Container(
//                 padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
//                 child: Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      // (11, 81, 145, 1)
//                      Text('TODAY\'S WORK',style:cardTitleStyle.copyWith(color: const Color.fromRGBO(11, 81, 145, 1)),),
//                      Text(permissionData,style: reportDetailsTextStyle ),
//                      SizedBox(height: MediaQuery.of(context).size.height*0.04),
//                      Text(description , style: inputFieldTitleStyle)
//                    ],
//                  ),
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
