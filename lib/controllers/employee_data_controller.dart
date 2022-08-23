import 'package:attendance/controllers/manager_data_controller.dart';
import 'package:attendance/moduls/employee.dart';
import 'package:attendance/moduls/manager_permission.dart';
import 'package:attendance/moduls/manager_report.dart';
import 'package:attendance/moduls/manager_vacation.dart';
import 'package:attendance/moduls/permission.dart';
import 'package:attendance/moduls/report.dart';
import 'package:attendance/moduls/vacation.dart';
import 'package:attendance/pages/employee/employee_home_page.dart';
import 'package:attendance/pages/manager/manager_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeController extends GetxController {
  final RxList<Vacation> employeeVacationList = <Vacation>[].obs;
  final RxList<Permission> employeePermissionList = <Permission>[].obs;
  final RxList<Report> employeeReportList = <Report>[].obs;

  Employee employee = Employee(
      email: 'email',
      name: 'name',
      workDays: 0,
      vacationDays: 0,
      delayDays: 0,
      permission: 0,
      report: 0,
      absentDays: 0,
      userType: false,
      employeeId: 'employeeId',
      jobTitle: 'jobTitle'
  );

  // bool employee = true;
  // String employeeName ='';
  // String employeeJopTitle = '';
  // String employeeId ='';
  // int employeeWorkDays =0;
  // int employeeVacationDays =0;
  // int employeeAbsentDays =0;
  // int employeePermission =0;
  // int employeeReport =0;

  Future<void> login(String email, String password) async {
    debugPrint('Login function called');
    final QuerySnapshot<Map<String, dynamic>> querySnapshotEmployees =
        await FirebaseFirestore.instance.collection('employee').get();
    for (var employee in querySnapshotEmployees.docs) {
      final employeeData = await FirebaseFirestore.instance
          .collection('employee')
          .doc(employee.id)
          .get();
      if (email == employeeData['email'] && password == employeeData['password']) {
        debugPrint('is Employee.'+employeeData['name']);
        fetchEmployeeData(employee.id);
        Get.off(const HomeScreen());
      }
    }
    final QuerySnapshot<Map<String, dynamic>> querySnapshotManagers =
    await FirebaseFirestore.instance.collection('manager').get();
    for (var manager in querySnapshotManagers.docs) {
      final managerData = await FirebaseFirestore.instance
          .collection('manager')
          .doc(manager.id)
          .get();
      if (email == managerData['email'] &&
          password == managerData['password']) {
        debugPrint('is Manager.');
        Get.find<ManagerController>().fetchManagerData(manager.id);
        Get.off(const ManagerHomePage());
      }
    }

    // .then((QuerySnapshot querySnapshot) =>
    // querySnapshot.docs.forEach((employee) async {
    //
    //   if (email == employeeData['email'] && password == employeeData['password']) {
    //     debugPrint('employee id '+employee.id);
    //     isEmployee(employeeData['employee']);
    //     fetchDataFromCloud(employee.id);
    //     fetchVacationRequest();
    //     fetchPermissionRequest();
    //     fetchReports(employee.id);
    //     // managerController.fetchPermissionRequestForManager();
    //     // managerController.fetchVacationRequestForManager();
    //     // managerController.fetchVacationRequestForManager();
    //     // Get.to(const ManagerHomePage());
    //   } else {
    //     debugPrint('Nooo');
    //     // Get.bottomSheet(BottomSheet(
    //     //     onClosing: onClosing,
    //     //     builder: builder
    //     // ));
    //     // Get.to(const ManagerHomePage());
    //     return;
    //   }
    // }));
    update();
  }

  Future<void> fetchEmployeeData(String employeeId) async {
    debugPrint('fetchEmployeeData called!!!!');
    debugPrint('Employee Id in fetchEmployeeData > '+employeeId);
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final employeeData = await FirebaseFirestore.instance
        .collection('employee')
        .doc(employeeId)
        .get();
    debugPrint('Employee Name in fetchEmployeeData > '+employeeData['name']);
    employee = Employee(
        employeeId: employeeId,
        email: employeeData['email'],
        name: employeeData['name'],
        jobTitle: employeeData['jop_title'],
        userType: true,
        delayDays: employeeData['delay_days'],
        absentDays: employeeData['absent_days'],
        imageUrl: employeeData['image_url'],
        permission: employeeData['permissions'],
        report: employeeData['reports'],
        vacationDays: employeeData['vacations'],
        workDays: employeeData['work_days']
    );
    debugPrint('employee name >  ' + employee.name);
    // sharedPreferences.setString('name', employeeData['name']);
    // sharedPreferences.setInt('email', employeeData['email']);
    // sharedPreferences.setString('jobTitle', employeeData['jop_title']);
    // sharedPreferences.setInt('absent_days', employeeData['absent_days']);
    // sharedPreferences.setInt('vacation', employeeData['vacations']);
    // sharedPreferences.setInt('permission', employeeData['permissions']);
    // sharedPreferences.setInt('reports', employeeData['reports']);
    // sharedPreferences.setBool('isEmployee', true);
    // sharedPreferences.setString('employeeId', employeeId);
    update();
  }

  // void fetchDataEmployeeFromPreferences ()async{
  //   debugPrint('fetchDataEmployeeFromPreferences called');
  //   SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
  //   employeeName =sharedPreferences.getString('name')!;
  //   employeeWorkDays = sharedPreferences.getInt('work_days')!;
  //   employeeReport = sharedPreferences.getInt('reports')!;
  //   employeeVacationDays =sharedPreferences.getInt('vacation')!;
  //   employeeAbsentDays = sharedPreferences.getInt('absent_days')!;
  //   employeeJopTitle = sharedPreferences.getString('jobTitle')!;
  //   employee = sharedPreferences.getBool('isEmployee')!;
  //   employeeId= sharedPreferences.getString('employeeId')!;
  //   employeePermission = sharedPreferences.getInt('permission')!;
  //   // debugPrint(sharedPreferences.getString('employeeId')!);
  //   debugPrint('fetch  employee id ' +employeeId);
  //
  // }

  void logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    debugPrint('shared Preferences clear');
  }

  ////
  Future<bool> autoLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.isNullOrBlank!;
  }

  Future<List<Vacation>> fetchVacationRequest() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('fetch vacation called');
    debugPrint(' employee id ' + employee.employeeId);
    final QuerySnapshot<Map<String , dynamic>> querySnapshotEmployeeVacationsRequest
    = await FirebaseFirestore.instance
        .collection('employee/${employee.employeeId}/vacation')
        .get();
    for(var vacation in querySnapshotEmployeeVacationsRequest.docs ){
      final employeeRequest = await FirebaseFirestore.instance
          .collection('employee/${employee.employeeId}/vacation')
          .doc(vacation.id)
          .get();
      if (employeeVacationList.any((element) => element.vacationId == vacation.id)){
        employeeVacationList[employeeVacationList.indexWhere((element) => element.vacationId == vacation.id)]=
           Vacation(
              vacationId: vacation.id,
              desc: employeeRequest['description'],
              reason: employeeRequest['reason'],
              startDate: employeeRequest['start_time'].toString(),
              endDate: employeeRequest['end_time'].toString(),
              state: employeeRequest['state'],
            );
        debugPrint('vacation list '+Get.find<EmployeeController>().employeeVacationList.length.toString());
      }
      else{
        employeeVacationList.add(Vacation(
          vacationId: vacation.id,
          desc: employeeRequest['description'],
          reason: employeeRequest['reason'],
          startDate: employeeRequest['start_time'].toString(),
          endDate: employeeRequest['end_time'].toString(),
          state: employeeRequest['state'],
        ));
        debugPrint('vacation list '+Get.find<EmployeeController>().employeeVacationList.length.toString());

      }
    }
        // .then((QuerySnapshot snapshot) =>
        //     snapshot.docs.forEach((DocumentSnapshot documentSnapshot) async {
        //
        //
        //       // sharedPreferences.setStringList('vacationRequest',employeeVacationList.toJson());
        //       // debugPrint(sharedPreferences.getStringList('vacationRequests').toString());
        //       // debugPrint(employeeVacationList[0].reason);
        //       debugPrint(employeeVacationList.length.toString());
        //     }));
    return employeeVacationList;
    update();
  }

  Future<List<Permission>> fetchPermissionRequest() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('fetch permission called');

    final QuerySnapshot<Map<String , dynamic>> querySnapshotEmployeePermissionRequest = await FirebaseFirestore.instance
        .collection('employee/${employee.employeeId}/permission')
        .get();
    for(var permission in querySnapshotEmployeePermissionRequest.docs){
      final employeeRequest = await FirebaseFirestore.instance
          .collection(
          'employee/${employee.employeeId}/permission')
          .doc(permission.id)
          .get();
      if(employeePermissionList.any((element) =>
      element.permissionID == permission.id)){
        employeePermissionList[employeePermissionList
            .indexWhere((element) => element.permissionID == permission.id)]=
           Permission(
             permissionID: permission.id,
              desc: employeeRequest['description'],
              reason: employeeRequest['reason'],
              date: employeeRequest['date'].toString(),
              time: employeeRequest['time'].toString(),
              state: employeeRequest['state'],
            );
      }
      else{
        employeePermissionList.add(Permission(
          permissionID: permission.id,
          desc: employeeRequest['description'],
          reason: employeeRequest['reason'],
          date: employeeRequest['date'].toString(),
          time: employeeRequest['time'].toString(),
          state: employeeRequest['state'],
        ));
      }
    }
    update();
    return employeePermissionList;
  }

  Future<List<Report>> fetchReports() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('fetch Report called');
    final QuerySnapshot<Map<String , dynamic>> querySnapshotEmployeeReport = await FirebaseFirestore.instance
        .collection('employee/${employee.employeeId}/report')
        .get();
    for(var report in querySnapshotEmployeeReport.docs){
      final employeeReport = await FirebaseFirestore.instance
          .collection(
          'employee/${employee.employeeId}/report')
          .doc(report.id)
          .get();
      if(employeeReportList.any((element) => element.reportID == report.id)){
        employeeReportList[employeeReportList
            .indexWhere((element) => element.reportID == report.id)]=

            Report(
              reportID: report.id,
          desc: employeeReport['description'],
          reportTitle: employeeReport['report_title'],
          time: employeeReport['time'],
        );
      }
      else{
        employeeReportList.add(Report(
          reportID: report.id,
          desc: employeeReport['description'],
          reportTitle: employeeReport['report_title'],
          time: employeeReport['time'],
        ));
      }
    }
    update();
    return employeeReportList;
  }

  Future<void> addVacationRequest(
      {required String requestDescription,required String requestReason,
      required DateTime startDate , required DateTime endDate
      }) async {
    debugPrint('addVacationRequest called!!!!');
    FirebaseFirestore.instance.collection('employee/${employee.employeeId}/vacation')
        .add({
      'description': requestDescription,
      'reason': requestReason,
      'start_time': DateFormat("yyyy-MM-dd").format(startDate).toString(),
      'end_time': DateFormat("yyyy-MM-dd").format(endDate).toString(),
      'state': 'pending'
    });
    updateVacationNum();
  }

  Future<void> updateVacationNum() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final vacationsCount = await FirebaseFirestore.instance
        .collection('employee')
        .doc(employee.employeeId)
        .get();
    int vacationsNewCount = vacationsCount['vacations'] + 1;
    debugPrint('vacations Num' + vacationsNewCount.toString());
    final employeeRequest = FirebaseFirestore.instance
        .collection('employee')
        .doc(employee.employeeId);
    employeeRequest.update({'vacations': vacationsNewCount});
    update();
  }

  Future<void> addPermissionRequest(
      String requestDescription, String requestReason) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // debugPrint(employeeId);
    final employeeRequest = FirebaseFirestore.instance
        .collection(
            'employee/${employee.employeeId}/permission')
        .doc();
    await employeeRequest.set({
      'description': requestDescription,
      'reason': requestReason,
      'time': DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
      'state': 'pending',
      'date': DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
    });
    updatePermissionNum();
  }

  Future<void> updatePermissionNum() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final employeeData = await FirebaseFirestore.instance
        .collection('employee')
        .doc(employee.employeeId)
        .get();
    int vacations = employeeData['permissions'] + 1;
    debugPrint('vacations Num' + vacations.toString());
    final employeeRequest = FirebaseFirestore.instance
        .collection('employee')
        .doc(employee.employeeId);
    employeeRequest.update({'permissions': vacations});
    update();
    // sharedPreferences.setInt('permission', employeeData['permissions']);
  }

  Future<void> addReport(String reportDescription, String reportTitle) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final employeeReport = FirebaseFirestore.instance
        .collection(
            'employee/${employee.employeeId}/report')
        .doc();
    await employeeReport.set({
      'description': reportDescription,
      'report_title': reportTitle,
      'time': DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
    });
    updateReportNum();
  }

  Future<void> updateReportNum() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final employeeData = await FirebaseFirestore.instance
        .collection('employee')
        .doc(employee.employeeId)
        .get();
    int vacations = employeeData['reports'] + 1;
    debugPrint('vacations Num' + vacations.toString());
    final employeeRequest = FirebaseFirestore.instance
        .collection('employee')
        .doc(employee.employeeId);
    employeeRequest.update({'reports': vacations});
    update();
    // sharedPreferences.setInt('report', employeeData['reports']);
  }

// void isEmployee(bool isEmployee)  {
//   debugPrint('is Employee  ? ' + employee.toString());
//   isEmployee? Get.to(const HomeScreen()) :Get.to(const ManagerHomePage());
//   // Get.to(const ManagerHomePage());
// }

}
