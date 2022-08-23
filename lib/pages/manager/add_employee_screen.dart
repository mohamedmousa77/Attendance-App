import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/moduls/employee.dart';
import 'package:attendance/pages/manager/manager_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';
import '../../widgets/appbar/customer_appbar.dart';
import '../../widgets/text_style.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  String email ='';
  String password ='';
  String employeeName ='' ;
  String jopTitle='';
  Widget getBody(){
    return SingleChildScrollView(
      child: Column(
        children: [
          // email text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/person.svg',color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                  'Email'.toUpperCase(),
                  style:GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color:primaryGreenColor_1,
                      ))
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // email data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child: TextField(
              onChanged: (newValue){
             setState(() {
               email = newValue;
             });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // password text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/lock.svg',color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                  'Password'.toUpperCase(),
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color:primaryGreenColor_1,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          //password data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child: TextField(
              onChanged: (newValue){
                setState(() {
                  password = newValue;
                });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // employee name text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/person.svg',color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                  'employee name '.toUpperCase(),
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color:primaryGreenColor_1,
                      ))
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // employee name data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child: TextField(
              onChanged: (newValue){
                setState(() {
                  employeeName = newValue;
                });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // jop title text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/visit_icon.svg',width:25,color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                  'jop title'.toUpperCase(),
                  style:GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color:primaryGreenColor_1,
                      ))
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // jop title data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child:  TextField(
              onChanged: (newValue){
                setState(() {
                  jopTitle = newValue;
                });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // Submit Button
          GestureDetector(
            onTap: () {
              if(email.isEmpty || password.isEmpty || employeeName.isEmpty || jopTitle.isEmpty){
                Get.snackbar('Invalid employee information', 'please make sure  ',snackPosition: SnackPosition.BOTTOM);
              }else{
                Get.find<ManagerController>().addEmployee(
                    employee: Employee(
                      employeeId:'',
                      userType: true,
                      email:  email,
                      name: employeeName,
                      password: password,
                      jobTitle: jopTitle,
                      permission: 0,
                      imageUrl: "",
                      report: 0,
                      vacationDays: 0,
                      workDays: 0,
                      absentDays: 0,
                      delayDays: 0,
                    ));
                Get.off(const ManagerHomePage());
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,

              decoration: BoxDecoration(
                  color: primaryGreenColor_1,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SUBMIT', style: buttonTitleStyle),
                  SizedBox(width: MediaQuery.of(context).size.width*0.1),
                  SvgPicture.asset('assets/icons/true_sign.svg',width:25 ,color: whiteColor),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customerAppbar(context, 'ADD EMPLOYEE'),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            getBody()
          ],
        ),
      )
      ,
    );
  }
}
