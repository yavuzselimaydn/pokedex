import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper{

  UIHelper._();

  static double appTitleHeight(){
    return ScreenUtil().orientation == Orientation.portrait //ekran dikey modda ise
      ? 0.15.sh  // ekran dikey ise ekran yuksekliginin yuzde 15 ni, yukseklik yap
      : 0.15.sw;  // ekran yatay ise ekran genisliginin yuzde 15 ni, yukseklik yap
  }

  static EdgeInsets defaultPadding(){
    return ScreenUtil().orientation == Orientation.portrait 
      ? EdgeInsets.all(12.h) //ekran diket ise padding i 12 yap ama yukseklige gore oranla baska cihazda
      : EdgeInsets.all(8.w);  //ekran yatay ise paddingi 8 yap ama genislige gore oranla bask cihazda
  }

  static double calculatePokeImgAndBallSize(){
    return ScreenUtil().orientation == Orientation.portrait 
      ? 0.2.sw
      : 0.3.sh;
  }

  static final Map<String, Color> _typeColorMap = {
    'Grass': Colors.green,
    'Fire': Colors.redAccent,
    'Water': Colors.blue,
    'Electric': Colors.yellow,
    'Rock': Colors.grey,
    'Ground': Colors.brown,
    'Bug': Colors.lightGreenAccent.shade700,
    'Psychic': Colors.indigo,
    'Fighting': Colors.orange,
    'Ghost': Colors.deepPurple,
    'Normal': Colors.black26,
    'Poison': Colors.deepPurpleAccent
  };

  static Color getColorFromType(String type) {
    if (_typeColorMap.containsKey(type)) {
      return _typeColorMap[type] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }

  static double iconSize(){
    return ScreenUtil().orientation == Orientation.portrait 
      ? 24.h 
      : 16.w;
  }
}