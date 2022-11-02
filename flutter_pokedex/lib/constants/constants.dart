import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();
  static const String title = 'Pokedex';
  static TextStyle getTitleTextStyle() {
    return  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(48),
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(30),
    );
  }

  static TextStyle getTypeChipTextStyle() {
    return  TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(20),
    );
  }
  static TextStyle getPokeInfoLabelTextStyle() {
    return  TextStyle(
      color: Colors.black,
      fontSize: _calculateFontSize(20),
      fontWeight: FontWeight.bold
    );
  }
  static TextStyle getPokeInfoTextStyle() {
    return  TextStyle(
      color: Colors.black,
      fontSize: _calculateFontSize(16),
      
    );
  }
  

  static double _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return size.sp/2;
    }
  }
}
