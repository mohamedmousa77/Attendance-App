import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/customer_inputfield.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VacationRequest extends StatefulWidget {
  const VacationRequest({Key? key}) : super(key: key);

  @override
  _VacationRequestState createState() => _VacationRequestState();
}

class _VacationRequestState extends State<VacationRequest> {
  String vacationReason = '';
  String vacationDescription = '';
  DateTimeRange dateTimeRange=DateTimeRange(
      // start: DateTime.now(),
    start: DateTime(2020,11,24),
      end:DateTime(2022,11,24)

      // end:DateTime.now().add(const Duration(days: 7))
  );

  Widget getBody() {
    final startDate = dateTimeRange.start;
    final endDate = dateTimeRange.end;
    final vacationDuration = dateTimeRange.duration;
    return Container(
      // height: MediaQuery.of(context).size.height * 0.02,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: greyColor,
                offset: const Offset(0, 3),
                spreadRadius: 3,
                blurRadius: 7)
          ]),
      child: Expanded(
        child: Column(
          children: [
            // change vacation duration
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.1),
                    child: Text(
                     'Start Day',
                      style: profileTextStyle,
                    )),
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.13),
                    child: Text(
                      'End Day',
                      style: profileTextStyle,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: pickDateRange,
                  child: Container(
                      margin: EdgeInsets.only(
                          // top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.1),
                      child: Text(
                        // '${startDate.year}/${startDate.month}/${startDate.day}',
                        // DateFormat('dd/MM/yyyy').format(startDate),
                        DateFormat.yMMMd().format(startDate),
                        style: inputFieldTitleStyle,
                      )),
                ),
                GestureDetector(
                  onTap: pickDateRange,
                  child: Container(
                      margin: EdgeInsets.only(
                          // top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.1),
                      child: Text(
                        DateFormat.yMMMd().format(endDate),
                        style: inputFieldTitleStyle,
                      )),
                ),
              ],
            ),
            //vacation reason text
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.08),
                    child: Text(
                      'Vacation reason'.toUpperCase(),
                      style: profileTextStyle,
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            //vacation reason field
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ofWhiteColor

                  // const Color.fromRGBO(236, 238, 244, 1)

              ),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                      // icon: Icon(Icons.person_outline,
                      //     color: greyColor),
                      border: InputBorder.none,

                      hintStyle: inputFieldTitleStyle),
                  onChanged: (value) {
                    vacationReason = value;
                  },
                  onSaved: (value) {
                    vacationReason = value!;
                  },
                ),
              ),
            ),
            //vacation description text
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05,
                        left: MediaQuery.of(context).size.width * 0.08),
                    child: Text(
                      'Vacation description'.toUpperCase(),
                      style: profileTextStyle,
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            //vacation description field
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ofWhiteColor),
              child: Center(
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(

                      // icon: Icon(Icons.person_outline,
                      //     color: greyColor),
                      border: InputBorder.none,
                      // hintText: 'Vacation description',
                      hintStyle: inputFieldTitleStyle),
                  onChanged: (value) {
                    vacationDescription = value;
                  },
                  onSaved: (value) {
                    vacationDescription = value!;
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            //Button send request
            GestureDetector(
              onTap: () {
                if (vacationDescription.isEmpty ||
                    vacationReason.isEmpty) {
                  Get.snackbar('Invalid Data', 'please make sure all field is complete',snackPosition: SnackPosition.BOTTOM,colorText: Colors.red);
                } else {
                  Get.find<EmployeeController>().addVacationRequest(requestDescription: vacationDescription
                      ,requestReason: vacationReason,
                      startDate: startDate,
                    endDate: endDate
                  );
                  debugPrint('Done');
                  Get.back();
                }
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    color: primaryGreenColor_1,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Text('Submit REQUEST', style: buttonTitleStyle)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }

  Future pickDateRange ()async{
    DateTimeRange ? newDateTimeRange = await
    showDateRangePicker(
      context: context,
        initialDateRange: dateTimeRange,
        firstDate: DateTime(1999),
        lastDate: DateTime(2023),
      // initialEntryMode:  DatePickerEntryMode.calendar

    );
    if(newDateTimeRange == null ) return; // if press 'X'
    setState(() {
      dateTimeRange = newDateTimeRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customerAppbar(context, 'REQUEST VACATION'),
          getBody(),
        ],
      ),
    );
  }
}
