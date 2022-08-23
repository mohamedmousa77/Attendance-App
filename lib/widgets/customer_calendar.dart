import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Widget containerMenu() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.05,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.25,
      decoration: BoxDecoration(
        color:const Color.fromRGBO(26, 185, 124, 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('2021', style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),),
          IconButton(onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp, color: Colors.white,
                size: 25,)),
        ],
      ),
    );
  }

  bool isDelay = true;
  bool isPresent = false;
  bool isAbsent = false;
   Color _color = primaryGreenColor_2;
   List<bool> dayState = [true,true,true,true,true,false,false,false,true,true,false,false,
     false,true,true];
      // final formattedDate = DateFormat.yMd().format(DateTime.now());
      final _day = DateFormat('####-##-dd').format(DateTime.now());
      // final  DateTime _formatteedDate = DateTime.utc(2002,20,10);
   final List<Map<String,bool>> _clientState = [{
     DateFormat('dd').format(DateTime.utc(2002,20,5)):true,
     DateFormat('dd').format(DateTime.utc(2002,20,18)):false,
     DateFormat('dd').format(DateTime.utc(2002,20,15)):true,
     DateFormat('dd').format(DateTime.utc(2002,20,12)):false,
     DateFormat('dd').format(DateTime.utc(2002,20,12)):true,
   }];

   Color checkDayState(){

   for(var day in _clientState){
     // final _day = DateFormat('dd').format(DateTime.utc(2002,20,10));
     debugPrint(day[1].toString());

     if(day[1] == true){
       setState(() {
         isPresent = true;
         isAbsent = false;
         isDelay = false;
         _color = primaryGreenColor_2;
       });
     } else{
       setState(() {
         isAbsent = true;
         isPresent = false;
         isDelay =false;
         _color =const Color.fromRGBO(255, 100, 100, 1);
       });
     }
   }

// if(isDelay) {
//   setState(() {
//     isPresent = false;
//     isAbsent = false ;
//     _color = const Color.fromRGBO(255, 221, 87, 1);
//   });
// }

    return _color;
  }
  late final DateTime _selectedDay;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
          gradient: LinearGradient(
            colors: [primaryGreenColor_1, primaryGreenColor_2],
            end:Alignment.topCenter,
            begin:Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                offset: Offset(0, 5),
                blurRadius: 5
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              child: Text('CALENDER', style: GoogleFonts.montserrat(
                textStyle: const TextStyle(color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                containerMenu(),
                containerMenu(),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 1),
              lastDay: DateTime.utc(2030, 10, 1),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              // currentDay:CurrentDay ?? DateTime.now(),
              weekendDays:const [6],
              pageAnimationEnabled: true,
              onDaySelected: (selectedDay, _) {
                debugPrint(selectedDay.toString());
                // setState(() {
                //   _selectedDay = selectedDay;
                //    // _focusedDay = focusedDay; // update `_focusedDay` here as well
                // });
              },
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  if (day.day == _clientState[0]) {
                    final text = DateFormat.yMd().format(day);
                    debugPrint(text);
                    return Center(
                      child: Text(
                        text,
                        style:const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                },
              ),
              calendarStyle:const  CalendarStyle(
                todayDecoration: BoxDecoration(
                    // color:  checkDayState(),
                    shape: BoxShape.circle
                ),
                defaultDecoration: BoxDecoration(
                    color: Color.fromRGBO(255, 221, 87, 1),
                  // color:  checkDayState(),
                    shape: BoxShape.circle
                ),
                weekendDecoration: BoxDecoration(
                    // color: Color.fromRGBO(255, 100, 100, 1),
                  color: Colors.blue,
                   // color: checkDayState(),
                    shape: BoxShape.circle
                ),
                weekendTextStyle: TextStyle(color: Colors.white),
                defaultTextStyle:const TextStyle(color: Colors.white),
                todayTextStyle:const TextStyle(color: Colors.white),
                canMarkersOverflow: true,
                markerDecoration:const BoxDecoration(color: primaryGreenColor_1),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: GoogleFonts.montserrat(
                    textStyle: const TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                    ),
                  ),
                  weekendStyle: GoogleFonts.montserrat(
                    textStyle: const TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  )
              ),
              headerVisible: false,
            ),
          ],
        ),

      ),
    );
  }
}
