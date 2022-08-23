import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/appbar/customer_appbar.dart';
import 'package:attendance/widgets/customer_inputfield.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestPermission extends StatefulWidget {
  const RequestPermission({Key? key}) : super(key: key);

  @override
  _RequestPermissionState createState() => _RequestPermissionState();
}

class _RequestPermissionState extends State<RequestPermission> {
  // final EmployeeController employeeController = EmployeeController();
  String employeePermissionType = '';
  String employeePermissionDesc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customerAppbar(context, 'REQUEST PERMISSION'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1),
              child: Text(
                'Permission Title'.toUpperCase(),
                style: profileTextStyle,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // permission title field
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02),
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
                    employeePermissionType = value;
                  },
                  onSaved: (value) {
                    employeePermissionType = value!;
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // permission desc text
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                child: Text(
                  'Permission description'.toUpperCase(),
                  style: profileTextStyle,
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // permission desc field
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02),
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
                      employeePermissionDesc = value;
                    },
                    onSaved: (value) {
                      employeePermissionDesc = value!;
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // Submit Button
            GestureDetector(
              onTap: () {
                if (employeePermissionDesc.isEmpty ||
                    employeePermissionType.isEmpty) {
                  Get.snackbar(
                      'Invalid Data', 'please make sure all field is complete',snackPosition:SnackPosition.BOTTOM,colorText: Colors.red);
                } else {
                  Get.find<EmployeeController>().addPermissionRequest(
                      employeePermissionDesc, employeePermissionType);
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
                child: Center(
                    child:
                        Text('REQUEST A PERMISSION', style: buttonTitleStyle)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
