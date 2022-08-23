import 'dart:async';

import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/widgets/card/employee/primary_card_.dart';
import 'package:attendance/widgets/card/home_card.dart';
import 'package:attendance/widgets/card/employee/permission_card.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/chat_controller.dart';
import '../../widgets/card/employee/report_card.dart';
import '../../widgets/card/employee/vacation_card.dart';
import '../../widgets/employee/appbar_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/employee_data_controller.dart';
import '../../pages/employee/drawer_page.dart';
import '../../theme/theme.dart';
import '../chat_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  List<String> employeeOptions =['ATTENDANCE','PERMISSIONS','REPORTS','VACATION'];
  late TabController _tabControllerOptions ;
  bool employeeState =true;
  String startWorkTime = DateTime.now().hour.toString()
      + ' : '+ DateTime.now().minute.toString();
  Widget getAppbar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
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
                  // Menu button
                  GestureDetector(
                    onTap: () => Get.to( DrawerPage()),
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                      color: Colors.white,
                    ),
                  ),
                  // notification button
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
          // name
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05),
            child: Text('Good morning,\n Mr. ${Get.find<EmployeeController>().employee.name}',
                style: appbarTitleStyle.copyWith(fontWeight: FontWeight.w300)),
          ),
          GestureDetector(
            onTap: (){
              if(employeeState){
                setState(() {
                  employeeState=false;
                });
              }else{
                setState(() {
                  employeeState=true;
                  startWorkTime = DateTime.now().hour.toString()
                      +' : '+DateTime.now().minute.toString();
                });
              }
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.2,
                  top: MediaQuery.of(context).size.height * 0.02),
              child: CircleAvatar(
                radius: 130,
                backgroundColor: const Color.fromRGBO(215, 245, 250, 1),
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: const Color.fromRGBO(230, 248, 251, 1),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    child: Text(
                      employeeState ? 'START YOUR\n WORK DAY' :'Finish\n Work'.toUpperCase() ,
                      style: cardContentStyle.copyWith(
                          fontSize: 22 , color: primaryGreenColor_1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          employeeState
              ? Container()
              : Container(
            margin:EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.02,
                left: MediaQuery.of(context).size.width*0.3),
            child: Text('Start Work From : '+startWorkTime,
            style: GoogleFonts.montserrat(
              color: whiteColor,
              fontSize: 15
            )),
          ),
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    Get.find<ChatController>().fetchMessage();
    _tabControllerOptions = TabController(initialIndex: 0,length: 4, vsync: this);
    Timer(
      const Duration(seconds: 2),
        ()async{
          Get.find<EmployeeController>().fetchReports();
          Get.find<EmployeeController>().fetchVacationRequest();
          Get.find<EmployeeController>().fetchPermissionRequest();
          debugPrint('vacation list length  > '+Get.find<EmployeeController>().employeeVacationList.length.toString());
          debugPrint('report list length  > '+Get.find<EmployeeController>().employeeReportList.length.toString());
          debugPrint('permission list length  > '+Get.find<EmployeeController>().employeePermissionList.length.toString());
          setState(() {});
      });
    super.initState();

  }
  Widget getBody(){
    return Container(
    child:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.width * 0.04,
                  // right: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Text(
                  'Recent Activity',
                  style: appbarTitleStyle.copyWith(
                      color: const Color.fromRGBO(0, 12, 46, 1)),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),

            child: Column(
              // scrollDirection: Axis.vertical,
              children: [
                primaryCard(context,cardTitle:  'PRESENT',dayNumber: '27'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                primaryCard(context,cardTitle:  'ABSENT',dayNumber: '27'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Get.find<EmployeeController>().employeeReportList.isNotEmpty?
                reportCard(context,reportData: Get.find<EmployeeController>().employeeReportList.last.time)
                    : Container(),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Get.find<EmployeeController>().employeeVacationList.isNotEmpty?
                vacationCard(context,vacationState: Get.find<EmployeeController>().employeeVacationList.last.state,vacationData:  Get.find<EmployeeController>().employeeVacationList.last.startDate)
                    :Container(),
                Get.find<EmployeeController>().employeePermissionList.isNotEmpty?
                permissionCard(context,permissionData: Get.find<EmployeeController>().employeePermissionList.last.date,permissionState:Get.find<EmployeeController>().employeePermissionList.last.state)
                    :Container()
              ],
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                getAppbar(),
                Container(
                    width: MediaQuery.of(context).size.width ,
                    height: MediaQuery.of(context).size.height * 0.75,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.6,
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: TabBarView(
                    controller: _tabControllerOptions,
                    children: List.generate(4, (index) {
                      return homeCard(context,employeeOptions[index]);
                    }),
                  )
                ),
              ],
            ),
            getBody()
          ],
          // overflow: Overflow.visible,
          // fit  : StackFit.loose,
          //   clipBehavior : Clip.hardEdge,
        ),
      ),
    );
  }
}
