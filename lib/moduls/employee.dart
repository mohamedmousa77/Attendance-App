import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Employee {
  final String employeeId;
  final String email;
  final String name;
  final int workDays;
  final int vacationDays;
  final int absentDays;
  final int delayDays;
  final int permission;
  final int report;
  final bool userType;
  String? password;
  String? imageUrl;
  final String jobTitle;

  Employee({
      required this.email,
      required this.name,
      required this.workDays,
      required this.vacationDays,
      required this.delayDays,
      required this.permission,
      required this.report,
      required this.absentDays,
      required this.userType,
      required this.employeeId,
      required this.jobTitle,
      this.imageUrl,
      this.password,
  });
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'email': email,
  //     'password': password,
  //     'name': name,
  //     'image_url': imageUrl,
  //     'work_days': workDays,
  //     'absent_days': absentDays,
  //     'delay_days': delayDays,
  //     'vacation_days': vacationDays,
  //     'reports': report,
  //     'permissions': permission,
  //     'isEmployee': userType,
  //   };
  // }
  //
  // Employee.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
  //   email = json['email'] as String;
  //   password = json['password'] as String;
  //   name = json['name'] as String;
  //   imageUrl = json['image_url'] as String;
  //   workDays = json['work_days'] as int;
  //   absentDays = json['absent_days'] as int;
  //   delayDays = json['delay_days'] as int;
  //   vacationDays = json['vacation_days'] as int;
  //   permission = json['permissions'] as int;
  //   report = json['reports'] as int;
  //   isEmployee = json['isEmployee'] as bool;
  // }
}
