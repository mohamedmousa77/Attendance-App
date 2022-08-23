

import 'package:attendance/widgets/calendar/attendance_info_model.dart';
import 'package:get/get.dart';

class CalenderController extends GetxController{

  Map<DateTime , String> result = {
  };

  List<AttendanceInfo> attendanceInfo=
      [
        AttendanceInfo.fromJSON({
          'clock_in_time':"06-Jun-2020 15:00:00",
          'clock_out_time':"06-Jun-2020 09:00:00",
          'date':''
        }),

      ];

}