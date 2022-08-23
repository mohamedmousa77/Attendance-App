import 'dart:math';

import 'package:attendance/widgets/calendar/calendar_page.dart';
import 'package:attendance/widgets/calendar/const_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CalenderScreen extends StatefulWidget {
  static const String route_name = "calender_screen";

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  Random random = Random();
  Map<DateTime, String> data ={

  };
  DateTime _selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  // EmployeeDataAPI _employeeDataAPI = EmployeeDataAPI();

  Widget getBody (){
    return Calender(
      titleKey: "calendar",
      onChange: (date) => setState(() {
        _selectedDate = DateTime(
          date.year,
          date.month,
          date.day,
        );
      }),
      color: (date) {
        debugPrint('date >> '+date.toString());
        if (data.isNotEmpty) {
          // Map<DateTime, String> attendance = snapshot.data as Map<DateTime, String>;
          if (date == _selectedDate) {
            debugPrint('data is not empty !!!');
            return Colors.white;
          }
          if (date.day == 12 ) {
            debugPrint('date in absent ');
            return Colors.red;
          }
          if (date.day == 22 || date.day==9) {
            debugPrint('date in delay !!!');
            return ConstData.delay_color;
          }
            if (date.day==1) {
              return ConstData.pending_color;
            }
          else{
            return Color.fromRGBO(255, 255, 255, 0.5);
          }



          // if (data.containsKey(date)) {
          //   if (data[date] == "attend") {
          //     return Color.fromRGBO(255, 255, 255, 0.5);
          //   }
          //   if (data[date] == "delay") {
          //     return ConstData.delay_color;
          //   }
          //   if (data[date] == "absent") {
          //     return Colors.red;
          //   }
          //   if (data[date] == "vacation") {
          //     return ConstData.pending_color;
          //   }
          // }
        }
        return Colors.transparent;
      },
    );
  }

  @override
  void initState() {
    data.addAll({
      DateTime.utc(2022,12 , 7)  : 'delay',
      DateTime.utc(random.nextInt(2025) , random.nextInt(12) , random.nextInt(30))  : 'vacation',
      DateTime.utc(2022,12,1)  : 'absent',
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size _size = Size(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          getBody()
          // FutureBuilder(
          //   future:
          //       _employeeDataAPI.
          //       fetchMonthAttendance(_selectedDate).catchError(
          //     (error) {
          //       FocusScope.of(context).unfocus();
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text(error.toString()),
          //         ),
          //       );
          //     },
          //   ),
          //   builder: (ctx, snapshot) => Calender(
          //     titleKey: "calendar",
          //     onChange: (date) => setState(() {
          //       _selectedDate = DateTime(
          //         date.year,
          //         date.month,
          //         date.day,
          //       );
          //     }),
          //     color: (date) {
          //       if (snapshot.hasData) {
          //         Map<DateTime, String> attendance =
          //             snapshot.data as Map<DateTime, String>;
          //         if (date == _selectedDate) {
          //           return Colors.white;
          //         }
          //         if (attendance.containsKey(date)) {
          //           if (attendance[date] == "attend") {
          //             return Color.fromRGBO(255, 255, 255, 0.5);
          //           }
          //           if (attendance[date] == "delay") {
          //             return ConstData.delay_color;
          //           }
          //           if (attendance[date] == "absent") {
          //             return Colors.red;
          //           }
          //           if (attendance[date] == "vacation") {
          //             return ConstData.pending_color;
          //           }
          //         }
          //       }
          //       return Colors.transparent;
          //     },
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal:2),
          //   child: FutureBuilder(
          //     future: _employeeDataAPI.
          //     fetchDayEvents(_selectedDate).catchError(
          //       (error) {
          //         FocusScope.of(context).unfocus();
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(
          //             content: Text(error.toString()),
          //           ),
          //         );
          //       },
          //     ),
          //     builder: (ctx, snapShot) {
          //       if (snapShot.connectionState == ConnectionState.waiting) {
          //         // return PreLoader();
          //
          //       }
          //       if (snapShot.hasData) {
          //         List<Map<String, Map<String, dynamic>?>> list =
          //             snapShot.data as List<Map<String, Map<String, dynamic>?>>;
          //         // return AllEventsColumn(list);
          //       }
          //
          //       return Container();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
