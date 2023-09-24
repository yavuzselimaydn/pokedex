import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.appTitleHeight(),
      child: Stack(
        children: [
          Padding(       //EdgeInsets.all(8.w),  mainde verdigim genislige gore oranla yada ekran diket mi yatay mi ona gore de 
            padding: UIHelper.defaultPadding(), 
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.title,
                style: Constants.titleStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              Constants.logoUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh    //ekran dikey ise yuksekligin 5 te 1 ini genislik yap
                  : 0.2.sw,   //ekran yatay ise genisligin 5 te 1 ini genislik yap
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
