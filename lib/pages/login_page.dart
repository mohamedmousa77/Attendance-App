
import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/theme/theme.dart';
import 'package:attendance/widgets/customer_button.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/manager_data_controller.dart';
import 'employee/employee_home_page.dart';
import 'manager/manager_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false ;
  var controller = ScrollController();
  bool isVerified = false ;
  bool isLoading = false ;

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
        Get.find<EmployeeController>().fetchEmployeeData(employee.id);
        setState(() {
          isVerified = true;
        });
        Get.off(const HomeScreen());
        break;
      }else{
        setState(() {
          isLoading= false;
        });
        Get.snackbar('Invalid UserName or Password ',
            'Please try another one',colorText: Colors.red,
            snackPosition:SnackPosition.BOTTOM);
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
        setState(() {
          isLoading= false;
        });
        Get.off(const ManagerHomePage());
        break;
      }else{

        Get.snackbar('Invalid UserName or Password ',
            'Please try another one',colorText: Colors.red,
            snackPosition:SnackPosition.BOTTOM);
      }
    }
  }

  Widget loginButton(BuildContext context,String email ,String pass){
    // EmployeeController employeeController = EmployeeController();
    return GestureDetector(
      onTap: () async{
        if (email.isNotEmpty && password.isNotEmpty){
          setState(() {
            isLoading = !isLoading;
          });
          await login(email , pass);
        }else{
          Get.snackbar('Something went wrong',
              'Please make sure that all field is complete',colorText: Colors.red,
              snackPosition:SnackPosition.BOTTOM);
        }

        // Get.find<EmployeeController>().fetchDataEmployeeFromPreferences();
        //  Get.find<EmployeeController>().employee.userType?
        // Get.to(const HomeScreen()):Get.to(const ManagerHomePage());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            color: primaryGreenColor_1,
            borderRadius: BorderRadius.circular(25)),
        child: Center(child: Text(
            isLoading
                ? 'Loading ... '
                : 'LOGIN',

            style: buttonTitleStyle)),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      if(controller.offset>=108.2352961415919){
        controller.jumpTo(108.2352961415919);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.width * 0.3,
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: primaryGreenColor_1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Text(
              'ATTENDANCE \n    APPLICATION',
              style:appNameTitleStyle,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.3,
              left: MediaQuery.of(context).size.width * 0.05,
            ),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(25)),
            child: SingleChildScrollView(
              controller:controller,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05),
                        child: Text('LOGIN',
                            style: cardTitleStyle.copyWith(color: primaryGreenColor_1)
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: Text('Id or Username',
                            style: inputFieldTitleStyle.copyWith(
                                color: const Color.fromRGBO(18, 18, 18, 1))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.05),
                          child: userNameField(context, 'Id or Username')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: Text('Password',
                            style: inputFieldTitleStyle.copyWith(
                                color: const Color.fromRGBO(18, 18, 18, 1))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.05),
                          child: passwordField(context, 'Password')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: Text('Forget your password or id?',
                            style: inputFieldTitleStyle.copyWith(
                                color: const Color.fromRGBO(196, 198, 204, 1))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.05),
                          child: loginButton(context,email,password)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String email = '';

  String password = '';

  Widget passwordField(BuildContext context, String inputFieldTitle) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromRGBO(236, 238, 244, 1)),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
              suffixIcon:  IconButton(
                onPressed: (){
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                 icon:showPassword?const Icon(Icons.visibility_off):const Icon(Icons.remove_red_eye_sharp),
                  color:const Color.fromRGBO(196, 198, 204, 1)),
              icon: const Icon(Icons.lock_outline,
                  color: Color.fromRGBO(196, 198, 204, 1)),
              border: InputBorder.none,

              hintText: inputFieldTitle,
              hintStyle: inputFieldTitleStyle,

          ),
          obscureText:showPassword?false: true,
          keyboardType: TextInputType.visiblePassword,

          onChanged: (value) {
            // employeeController.email = value;
            password = value;
            debugPrint(password);
          },
          onSaved: (value) {
            password = value!;
            debugPrint(password);
          },
        ),
      ),
    );
  }

  Widget userNameField(BuildContext context, String inputFieldTitle) {
    // EmployeeController employeeController = EmployeeController();
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromRGBO(236, 238, 244, 1)),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
              icon: const Icon(Icons.person_outline,
                  color: Color.fromRGBO(196, 198, 204, 1)),
              border: InputBorder.none,
              hintText: inputFieldTitle,
              hintStyle: inputFieldTitleStyle),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
          email = value;
            debugPrint(email);
          },
          onSaved: (value) {
       email=value!;
          },
        ),
      ),
    );
  }
}
