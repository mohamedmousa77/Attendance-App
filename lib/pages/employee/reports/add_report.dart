import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/customer_inputfield.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewReport extends StatefulWidget {
  const NewReport({Key? key}) : super(key: key);

  @override
  _NewReportState createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  // EmployeeController employeeController = EmployeeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customerAppbar(context, 'ADD REPORT'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // report title text
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  'Report title'.toUpperCase(),
                  style: profileTextStyle,
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            //  report title field
            Container(
              margin:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(236, 238, 244, 1)),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                      // icon: const Icon(Icons.person_outline,
                      //     color: Color.fromRGBO(196, 198, 204, 1)),
                      border: InputBorder.none,
                      hintText: '',
                      hintStyle: inputFieldTitleStyle),
                  onChanged: (value) {
                    employeeReportTitle = value;
                  },
                  onSaved: (value) {
                    employeeReportTitle = value!;
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            //report desc text
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  'Report description'.toUpperCase(),
                  style: profileTextStyle,
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // report desc field
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(236, 238, 244, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        // icon: const Icon(Icons.person_outline,
                        //     color: Color.fromRGBO(196, 198, 204, 1)),
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: inputFieldTitleStyle),
                    onChanged: (value) {
                      employeeReportDescription = value;
                    },
                    onSaved: (value) {
                      employeeReportDescription = value!;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            GestureDetector(
              onTap: () {
                if(employeeReportDescription.isEmpty || employeeReportTitle.isEmpty){
                  Get.snackbar('Invalid Data', 'please make sure all field is complete',snackPosition: SnackPosition.BOTTOM,colorText: Colors.red);
                }else{
                  Get.find<EmployeeController>().addReport(employeeReportDescription, employeeReportTitle);
                  debugPrint('Done');
                  Get.back();
                }

              },
              child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    color: primaryGreenColor_1,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(child: Text( 'ADD REPORT', style: buttonTitleStyle)),
              ),
            ),


          ],
        ),
      ) ,
    );
  }
  String employeeReportTitle = '';

  String employeeReportDescription = '';


}
