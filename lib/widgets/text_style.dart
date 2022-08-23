import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/theme.dart';


TextStyle get primaryTextStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color:primaryGreenColor_1,
      ));
}
TextStyle get primaryInputTextStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color:primaryGreenColor_1,
      ));
}

TextStyle get appNameTitleStyle {
  return GoogleFonts.oswald(
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color:whiteColor,
      ));
}

TextStyle get appbarTitleStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: Color.fromRGBO(255, 255, 255, 1),
  ));
}


// STYLE OF TEXT IN LOGIN BUTTON
TextStyle get buttonTitleStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ));
}

TextStyle get cardContentStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w800,
    color: Color.fromRGBO(255, 255, 255, 1),
  ));
}


TextStyle get drawerTextStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w800,
        color: whiteColor,
      ));
}

TextStyle get cardTitleStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(0, 20, 59, 1),
  ));
}

TextStyle get inputFieldTitleStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(196, 198, 204, 1)));
}

TextStyle get profileTextStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO (18, 18, 18, 1),
      ));
}
TextStyle get reportDetailsTextStyle {
  return GoogleFonts.montserrat(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color:   Color.fromRGBO(11, 81, 145, 1),
      ));
}



