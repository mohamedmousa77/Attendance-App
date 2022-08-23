import 'package:attendance/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/appbar/customer_appbar.dart';
import '../../widgets/text_style.dart';
import 'add_employee_screen.dart';

class ManagerSetting extends StatefulWidget {
  const ManagerSetting({Key? key}) : super(key: key);

  @override
  State<ManagerSetting> createState() => _ManagerSettingState();
}

class _ManagerSettingState extends State<ManagerSetting> {
  Widget getBody(){
    return GestureDetector(
      onTap: (){
        Get.off(const AddEmployee());
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.13,
        width: MediaQuery.of(context).size.width*0.9,
        padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
        decoration: BoxDecoration(
          color: ofWhiteColor,
          borderRadius: BorderRadius.circular(25),

        ),
        child: Row(
          children: [
            Text('Add Employee',style:primaryTextStyle ),
           SizedBox(width: MediaQuery.of(context).size.width*0.25),
           const Icon(Icons.arrow_forward ,color: primaryGreenColor_1,size: 30, )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customerAppbar(context, 'SETTING'),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          getBody()
        ],
      ),
    );
  }
}
