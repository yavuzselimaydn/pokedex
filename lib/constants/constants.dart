import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants{

  Constants._(); //kurucu meetodu gizledim ve bu sınıftan nesne uretmeyi engelledim

  static const String logoUrl = "images/pokeball.png";

  static const String title = "Pokedex";

  static TextStyle titleStyle(){
    return  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: calculateFontSize(48),
    );
  }

  static TextStyle pokeNameStyle(){
    return  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: calculateFontSize(28)
    );
  }

  static TextStyle pokeTypeStyle(){
    return  TextStyle(
      color: Colors.white,
      fontSize: calculateFontSize(14)
    );
  }
  
  static calculateFontSize(int size){ // telefonun kendi font size artınca uygulamanın fontsizenin artmasını saglar .sp ile
    if(ScreenUtil().orientation == Orientation.portrait){
      return size.sp;                // .sp telefonun kendi font buyuklugune gorede oranlar size ı
    }
    else{
      return (size*0.7).sp;
    }
  }

  static TextStyle infoLabelTextStyle() {
    return TextStyle(
      fontSize: calculateFontSize(15),
      fontWeight: FontWeight.bold,
      color: Colors.black
    );
  }
  static TextStyle infoLabelTextStylePortrait() {
    return TextStyle(
      fontSize: calculateFontSize(20),
      fontWeight: FontWeight.bold,
      color: Colors.black
    );
  }

  static TextStyle infoTextStyle() {
    return TextStyle(
      fontSize: calculateFontSize(18),
      color: Colors.black
    );
  }


}