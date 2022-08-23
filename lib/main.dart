
import 'package:attendance/controllers/chat_controller.dart';
import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(EmployeeController());
  Get.put(ManagerController());
  Get.put(ChatController());
 // employeeController.fetchDataEmployeeFromPreferences();
 //  debugPrint('name in main >>>>  '+employeeController.employeeName);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.clear();
  debugPrint('Shared Preferences is clear');
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}