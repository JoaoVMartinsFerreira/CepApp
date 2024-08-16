import 'package:flutter/material.dart';

sealed class CepAppColors{
  static const Color whiteColor = Color(0XFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color primaryColor = Color(0xffEE040FB);
  static const Color secondaryColor = whiteColor;
  static const Color errorColor = Color(0xFFFF5252);

  // Tema escuro
  static const Color darkBgColor = Color(0Xff222222);
  
  // Tema claro
  static const Color lightBgColor = whiteColor;
}