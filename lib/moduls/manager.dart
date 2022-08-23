class Manager{
  final String  managerId;
  final String  email;
 final String name;
  final int  workDays;
  final  int  vacationDays;
  final int  absentDays;
  final  int  delayDays;
  final  int  permission;
  final  int  report;
  final  bool  userType;
  String ? jobTitle;
  String ? imageUrl;
  String? password;
  Manager({
  required  this.email,
    required this.name,
    required  this.workDays,
    required  this.vacationDays,
    required  this.delayDays,
    required  this.permission,
    required  this.report,
    required  this.absentDays,
    required  this.userType,
    required this.managerId,
    this.jobTitle,
    this.imageUrl,
    this.password,
});
}