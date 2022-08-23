import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../text_style.dart';


Widget managerCard (BuildContext context){
  String employeeFirstName ='Ahmed';
  String employeeLastName ='Ali';
  String employeeTitle='UI Designer' ;
  String dayNumber = '27';
  String monthName = 'NOV';
  String vacationState = 'PENDING';
  return  Container(
    height: MediaQuery.of(context).size.height*0.35,
    width:  MediaQuery.of(context).size.width*0.9,
    decoration: BoxDecoration(
      color:const  Color.fromRGBO(255, 255, 255, 1),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05),
          height: MediaQuery.of(context).size.height*0.15,
          width:  MediaQuery.of(context).size.width*0.9,
          decoration: BoxDecoration(
            color:const  Color.fromRGBO (236, 238, 244, 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              const  CircleAvatar(
                radius:50,
                backgroundImage: AssetImage('assets/images/profile_avatar.png'),
              ),
              Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(employeeFirstName+employeeLastName,style: cardTitleStyle,),
                    Text(employeeTitle,style: inputFieldTitleStyle,)
                  ],
                ),
              )

            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.2,
          width:  MediaQuery.of(context).size.width*0.9,
          decoration:const BoxDecoration(
            color:  Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft:Radius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.15,
                width:  MediaQuery.of(context).size.width*0.2,
                decoration: BoxDecoration(
                  color:const Color.fromRGBO (4, 162, 174, 1),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                    SvgPicture.asset(
                      'assets/icons/permission_icon.svg',
                      height: 30,
                      color:  Colors.white,
                    ),
                    Text(dayNumber, style: cardContentStyle),
                    Text(monthName,
                        style: cardContentStyle.copyWith(fontSize: 25)),
                  ],
                ),
              ),
              Text('VACATION',style: cardTitleStyle,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03,
                      top: MediaQuery.of(context).size.height * 0.015,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        color: vacationState=='PENDING'? const Color.fromRGBO (255, 208, 54, 1):
                        vacationState=='ACCEPTED'?const Color.fromRGBO (54, 255, 154, 1):const Color.fromRGBO (246, 63, 63, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      vacationState,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  vacationState=='PENDING'?
                  Container(
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,
                        color:  Color.fromRGBO(26, 185, 124, 1),
                      ),
                      child:const Icon(Icons.done,color: Colors.white,size: 45,)):Container(),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  vacationState=='PENDING'?
                  SvgPicture.asset('assets/icons/cross.svg',
                      width: 35,color: const Color.fromRGBO (237, 30, 84, 1))
                      :Container(),

                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}