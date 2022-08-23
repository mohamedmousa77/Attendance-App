import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/card/employee/primary_card_.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO (249, 248, 251, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customerAppbar(context,'ATTENDANCE',),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            primaryCard(context ,cardTitle:  'PRESENT',dayNumber: '27'),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            primaryCard(context ,cardTitle:  'VACATION',dayNumber: '16'),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            primaryCard(context ,cardTitle:  'ABSENT',dayNumber: '12'),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            primaryCard(context ,cardTitle:  'DELAY',dayNumber: '2'),
          ],
        ),
      ),
    );
  }
}
