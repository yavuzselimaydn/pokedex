import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(              // material appı sarmaladım screenutil ile
      designSize: const Size(412, 732), //tasarımı yaptıgım cihazın boyutlari
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData.dark().
          copyWith(   //copy with yani darkın tum ozellıklerini alır degısmek istedigimi ıcıne yazarim mesela text theme
            textTheme: GoogleFonts.latoTextTheme()
          ),
        home: const HomePage(),
      ),
    );
  }
}
