import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


enum ThemeStateEnum {light, dark}
class ThemeState extends Equatable{ // Equatable serve para verificar seuma instância de uma classe  é  igual a outra.
  final ThemeStateEnum themeStateEnum;

const ThemeState({this.themeStateEnum = ThemeStateEnum.light});

ThemeMode get getTheme => themeStateEnum == ThemeStateEnum.light ? ThemeMode.light : ThemeMode.dark;
  @override
  // TODO: implement props
  List<Object?> get props => [themeStateEnum];
  
}