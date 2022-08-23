import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/moduls/employee.dart';
import 'package:attendance/moduls/manager.dart';
import 'package:attendance/moduls/manager_permission.dart';
import 'package:attendance/moduls/manager_report.dart';
import 'package:attendance/moduls/manager_vacation.dart';
import 'package:attendance/pages/manager/permission/permission_manager_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagerController extends GetxController {
  final RxList<Employee> employeeDataList = <Employee>[].obs;
  final List<ManagerVacation> employeeVacationForManagerList = [];
  final List<ManagerReport> employeeReportForManagerList = [];
  final List<ManagerPermission> employeePermissionForManagerList = [];

  Manager manager = Manager(
    managerId: 'managerId',
    email: '',
    name: '',
    workDays: 0,
    vacationDays: 0,
    delayDays: 0,
    permission: 0,
    report: 0,
    absentDays: 0,
    userType: true,
  );

  Future<void> fetchManagerData(String managerId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('fetch manager data called!!!');
    final managerData = await FirebaseFirestore.instance
        .collection('manager')
        .doc(managerId)
        .get();
    // sharedPreferences.setString('name', managerData['name']);
    // sharedPreferences.setString('email', managerData['email']);
    // sharedPreferences.setString('jobTitle', managerData['jop_title']);
    // sharedPreferences.setInt('absent_days', managerData['absent_days']);
    // sharedPreferences.setInt('vacation', managerData['vacations']);
    // sharedPreferences.setInt('permission', managerData['permissions']);
    // sharedPreferences.setInt('reports', managerData['reports']);
    // sharedPreferences.setBool('isEmployee', true);
    // sharedPreferences.setString('employeeId', managerId);

    manager = Manager(
      managerId: managerId,
      email: managerData['email'],
      name: managerData['name'],
      workDays: managerData['work_days'],
      vacationDays: managerData['vacations'],
      delayDays: managerData['delay_days'],
      permission: managerData['permissions'],
      report: managerData['reports'],
      absentDays: managerData['absent_days'],
      userType: false,
    );
    // employee = true;
    // employeeId= employeeId;
    // employeeName =employeeData['name'];
    // employeeWorkDays = employeeData['work_days'];
    // employeeReport = employeeData['reports'];
    // employeeVacationDays =sharedPreferences.getInt('vacation')!;
    // employeeAbsentDays = sharedPreferences.getInt('absent_days')!;
    // employeeJopTitle = sharedPreferences.getString('jobTitle')!;
    //
    // employeePermission = sharedPreferences.getInt('permission')!;
  }

  Future<void> fetchAllEmployeesData() async {
    debugPrint('fetch data called!!!');
    final employeesId = await FirebaseFirestore.instance
        .collection('employee')
        .get()
        .then((QuerySnapshot querySnapshot) =>
            querySnapshot.docs.forEach((employee) async {
              final employeeData = await FirebaseFirestore.instance
                  .collection('employee')
                  .doc(employee.id)
                  .get();
              employeeDataList.add(Employee(
                name: employeeData['name'],
                absentDays: employeeData['absent_days'],
                workDays: employeeData['work_days'],
                vacationDays: employeeData['vacations'],
                report: employeeData['reports'],
                permission: employeeData['permissions'],
                email: employeeData['email'],
                password: employeeData['password'],
                userType: true,
                employeeId: employee.id,
                jobTitle: employeeData['jop_title'],
                delayDays: employeeData['delay_days'],
              ));
              debugPrint(employeeDataList.length.toString());
              debugPrint('Addddedddd');
            }));
  }

  Future<List<ManagerVacation>> fetchVacationRequestForManager() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final QuerySnapshot<Map<String, dynamic>> querySnapshotEmployees =
        await FirebaseFirestore.instance.collection('employee').get();
    for (var employee in querySnapshotEmployees.docs) {
      final QuerySnapshot<Map<String, dynamic>> querySnapshotVacations =
          await FirebaseFirestore.instance
              .collection('employee/${employee.id}/vacation')
              .get();
      for (var vacation in querySnapshotVacations.docs) {
        final employeeRequest = await FirebaseFirestore.instance
            .collection('employee/${employee.id}/vacation')
            .doc(vacation.id)
            .get();
        if (employeeVacationForManagerList
            .any((element) => element.vacationId == vacation.id)) {
          employeeVacationForManagerList[employeeVacationForManagerList
                  .indexWhere((element) => element.vacationId == vacation.id)] =
              ManagerVacation(
            vacationId: vacation.id,
            description: employeeRequest['description'],
            reason: employeeRequest['reason'],
            startDate: employeeRequest['start_time'].toString(),
            endDate: employeeRequest['end_time'].toString(),
            state: employeeRequest['state'],
            employeeName: sharedPreferences.getString('name')!,
            employeeTitle: sharedPreferences.getString('jobTitle')!,
          );
        } else {
          employeeVacationForManagerList.add(ManagerVacation(
            vacationId: vacation.id,
            description: employeeRequest['description'],
            reason: employeeRequest['reason'],
            startDate: employeeRequest['start_time'].toString(),
            endDate: employeeRequest['end_time'].toString(),
            state: employeeRequest['state'],
            employeeName: sharedPreferences.getString('name')!,
            employeeTitle: sharedPreferences.getString('jobTitle')!,
          ));
        }
      }
    }
    update();
    return employeeVacationForManagerList;
  }

  Future<List<ManagerReport>> fetchReportRequestForManager() async {
    debugPrint('fetchReportRequestForManager Called');
    final QuerySnapshot<Map<String, dynamic>> querySnapshotEmployees =
        await FirebaseFirestore.instance.collection('employee').get();
    for (var employee in querySnapshotEmployees.docs) {
      final QuerySnapshot<Map<String, dynamic>> querySnapshotReports =
          await FirebaseFirestore.instance
              .collection('employee/${employee.id}/report')
              .get();
      for (var report in querySnapshotReports.docs) {
        final reportData = await FirebaseFirestore.instance
            .collection('employee/${employee.id}/report')
            .doc(report.id)
            .get();
        final employeeData = await FirebaseFirestore.instance
            .collection('employee')
            .doc(employee.id)
            .get();
        if (employeeReportForManagerList
            .any((element) => element.reportId == report.id)) {
          employeeReportForManagerList[employeeReportForManagerList.indexWhere(
              (element) => element.reportId == report.id)] = ManagerReport(
            reportId: report.id,
            reportDescription: reportData['description'],
            reportTitle: reportData['report_title'],
            reportData: reportData['time'],
            employeeName: employeeData['name'],
            employeeTitle: employeeData['jop_title'],
          );
        } else {
          employeeReportForManagerList.add(ManagerReport(
            reportId: report.id,
            reportDescription: reportData['description'],
            reportTitle: reportData['report_title'],
            reportData: reportData['time'],
            employeeName: employeeData['name'],
            employeeTitle: employeeData['jop_title'],
          ));
        }
      }
    }
    // .then((QuerySnapshot querySnapshot) =>
    // querySnapshot.docs.forEach((DocumentSnapshot employId) async {
    //   final employeeRequestId = await FirebaseFirestore.instance
    //       .collection('employee/${employId.id}/report')
    //       .get()
    //       .then((QuerySnapshot snapshot) =>
    //       snapshot.docs
    //           .forEach((DocumentSnapshot documentSnapshot) async {
    //         final employeeRequest = await FirebaseFirestore.instance
    //             .collection('employee/${employId.id}/report')
    //             .doc(documentSnapshot.id)
    //             .get();
    //         final employeeData = await FirebaseFirestore.instance
    //             .collection('employee')
    //             .doc(employId.id)
    //             .get();
    //         employeeReportForManagerList.add(ManagerReport(
    //           reportDescription: employeeRequest['description'],
    //           reportTitle: employeeRequest['report_title'],
    //           reportData: employeeRequest['time'],
    //           employeeName: employeeData['name'],
    //           employeeTitle: employeeData['jop_title'],
    //         ));
    //         update();
    //         debugPrint('report manager list' +
    //             employeeReportForManagerList.length.toString());
    //       }));
    // }));
    update();
    return employeeReportForManagerList;
  }

  Future<List<ManagerPermission>> fetchPermissionRequestForManager() async {
    debugPrint('fetchReportRequestForManager Called');
    final QuerySnapshot<Map<String, dynamic>> querySnapshotEmployees =
        await FirebaseFirestore.instance.collection('employee').get();
    for (var employee in querySnapshotEmployees.docs) {
      final QuerySnapshot<Map<String, dynamic>>
          querySnapshotEmployeePermissions = await FirebaseFirestore.instance
              .collection('employee/${employee.id}/permission')
              .get();
      for (var permission in querySnapshotEmployeePermissions.docs) {
        final employeePermission = await FirebaseFirestore.instance
            .collection('employee/${employee.id}/permission')
            .doc(permission.id)
            .get();
        final employeeData = await FirebaseFirestore.instance
            .collection('employee')
            .doc(employee.id)
            .get();
        if (employeePermissionForManagerList
            .any((element) => element.permissionId == permission.id)) {
          employeePermissionForManagerList[
                  employeePermissionForManagerList.indexWhere(
                      (element) => element.permissionId == permission.id)] =
              ManagerPermission(
            permissionId: permission.id,
            description: employeePermission['description'],
            reason: employeePermission['reason'],
            state: employeePermission['state'],
            permissionData: employeePermission['time'],
            employeeName: employeeData['name'],
            employeeTitle: employeeData['jop_title'],
          );
        } else {
          employeePermissionForManagerList.add(ManagerPermission(
            permissionId: permission.id,
            description: employeePermission['description'],
            reason: employeePermission['reason'],
            state: employeePermission['state'],
            permissionData: employeePermission['time'],
            employeeName: employeeData['name'],
            employeeTitle: employeeData['jop_title'],
          ));
        }
      }
      debugPrint('permission list > ' +
          employeePermissionForManagerList.length.toString());
    }
    update();
    return employeePermissionForManagerList;
  }

  Future<void> updatePermissionState(
      ManagerPermission managerPermission, String newState) async {
    debugPrint('update Permission State called');
    final employeesId = await FirebaseFirestore.instance
        .collection('employee')
        .get()
        .then((QuerySnapshot querySnapshot) =>
            querySnapshot.docs.forEach((DocumentSnapshot employId) async {
              final employeeRequestId = await FirebaseFirestore.instance
                  .collection('employee/${employId.id}/permission')
                  .get()
                  .then((QuerySnapshot snapshot) => snapshot.docs
                          .forEach((DocumentSnapshot documentSnapshot) async {
                        final employeeRequest = await FirebaseFirestore.instance
                            .collection('employee/${employId.id}/permission')
                            .doc(documentSnapshot.id)
                            .get();
                        if (managerPermission.description ==
                                employeeRequest['description'] &&
                            managerPermission.permissionData ==
                                employeeRequest['time']) {
                          final employeeRequest = await FirebaseFirestore
                              .instance
                              .collection('employee/${employId.id}/permission')
                              .doc(documentSnapshot.id)
                              .update({'state': newState});
                        }
                        debugPrint(employeeRequest['state']);
                      }));
            }));
  }

  Future<void> updateVacationState(
      ManagerVacation managerVacation, String newState) async {
    debugPrint('update Permission State called');
    final employeesId = await FirebaseFirestore.instance
        .collection('employee')
        .get()
        .then((QuerySnapshot querySnapshot) =>
            querySnapshot.docs.forEach((DocumentSnapshot employId) async {
              final employeeRequestId = await FirebaseFirestore.instance
                  .collection('employee/${employId.id}/vacation')
                  .get()
                  .then((QuerySnapshot snapshot) => snapshot.docs
                          .forEach((DocumentSnapshot documentSnapshot) async {
                        final employeeRequest = await FirebaseFirestore.instance
                            .collection('employee/${employId.id}/vacation')
                            .doc(documentSnapshot.id)
                            .get();
                        if (managerVacation.description ==
                                employeeRequest['description'] &&
                            managerVacation.startDate ==
                                employeeRequest['start_time']) {
                          final employeeRequest = await FirebaseFirestore
                              .instance
                              .collection('employee/${employId.id}/vacation')
                              .doc(documentSnapshot.id)
                              .update({'state': newState});
                        }
                        debugPrint(employeeRequest['state']);
                      }));
            }));
  }

  Future<void> addEmployee({required Employee employee}) async {
    FirebaseFirestore.instance.collection('employee').add({
      'name': employee.name,
      'jop_title': employee.jobTitle,
      'email': employee.email,
      'password': employee.password,
      'absent_days': employee.absentDays,
      'image_url': employee.imageUrl,
      'permissions': employee.permission,
      'reports': employee.report,
      'vacations': employee.vacationDays,
      'work_days': employee.workDays,
      'delay_days': employee.delayDays
    });
  }
}
