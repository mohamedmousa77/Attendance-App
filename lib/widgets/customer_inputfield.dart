import 'package:attendance/controllers/employee_data_controller.dart';
import 'package:attendance/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget passwordInputField(BuildContext context, String inputFieldTitle) {
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
            suffixIcon: const Icon(Icons.remove_red_eye_sharp,
                color: Color.fromRGBO(196, 198, 204, 1)),
            icon: const Icon(Icons.lock_outline,
                color: Color.fromRGBO(196, 198, 204, 1)),
            border: InputBorder.none,
            hintText: inputFieldTitle,
            hintStyle: inputFieldTitleStyle),
        onChanged: (value) {
        },
        onSaved: (value) {
        },
      ),
    ),
  );
}





