import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:iphone_has_notch/iphone_has_notch.dart';

class Styles {
  static Color primaryColor = const Color.fromARGB(255, 164, 14, 3);
  static Color secondaryColor = const Color(0xffe65857);
  static Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  //static Transition? transition = Transition.leftToRight;
  static TextStyle poppins = GoogleFonts.poppins(color: Colors.black);
  static TextStyle poppins16w500 = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle poppins28w600 = GoogleFonts.poppins(
      fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle poppins18w600 = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle poppins20w500 = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black);
  static TextStyle poppins16w400 = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle sourceSansPro19w400 = GoogleFonts.sourceSansPro(
      fontSize: 19, fontWeight: FontWeight.w400, color: Colors.black);

  static TextStyle sourceSansPro20w700 = GoogleFonts.sourceSansPro(
      fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black);

  static TextStyle sourceSansPro17w400 = GoogleFonts.sourceSansPro(
      fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black);

  static TextStyle sourceSansPro17w600 = GoogleFonts.sourceSansPro(
      fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle sourceSansPro22w600 = GoogleFonts.sourceSansPro(
      fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black);

  static TextStyle sourceSansPro25w700 = GoogleFonts.sourceSansPro(
      fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black);

  static TextStyle sourceSansPro189w400 = GoogleFonts.sourceSansPro(
      fontSize: 189.54, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle sansita39w400 = GoogleFonts.sansita(
      fontStyle: FontStyle.italic,
      fontSize: 39,
      fontWeight: FontWeight.w400,
      color: Colors.black);
  static TextStyle sansitaSwashed = GoogleFonts.sansitaSwashed(
      fontStyle: FontStyle.italic,
      fontSize: 44.6,
      fontWeight: FontWeight.w700,
      color: Colors.black);
      static List<BoxShadow> myShadow = [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 3,
                            blurRadius: 3 , offset: Offset(0, 2.5))
                      ] ;
          static BorderRadius  myradius =  BorderRadius.circular(10);            

  // static BoxBorder? gardientBorder = const GradientBoxBorder(
  //   gradient: LinearGradient(
  //       begin: Alignment.topCenter,
  //       end: Alignment.bottomCenter,
  //       colors: [
  //         Color(0xffe65857),
  //         Color(0xffe65857),
  //         Color.fromARGB(255, 211, 75, 75),
  //         // Color(0xff761d31),
  //         Color.fromARGB(255, 139, 40, 62)
  //         //  Color.fromARGB(255, 255, 255, 255),
  //       ]),
  //   width: 1,
  // );
  static Gradient? gradient = const LinearGradient(
      end: Alignment.bottomRight,
      begin: Alignment.topLeft,
      colors: [
        Color(0xffe65857),
        Color(0xffe65857),
        Color.fromARGB(255, 211, 75, 75),
        // Color(0xff761d31),
        Color.fromARGB(255, 139, 40, 62)
      ]);

  static Color greenColor = const Color.fromARGB(255, 62, 188, 118);
  static Color textColor = const Color(0xFF3b3b3b);
  static Color bgColor = const Color.fromARGB(255, 231, 235, 236);
  static Color lightBgColor = const Color.fromARGB(255, 244, 247, 248);
  static Color yellowColor = const Color.fromARGB(255, 227, 167, 71);
  static Color purpleColor = const Color.fromARGB(255, 147, 132, 237);
  static Color blueColor = const Color.fromARGB(255, 20, 103, 179);
  static Color lightBlueColor = const Color.fromARGB(255, 85, 158, 226);
  static Color redColor = const Color.fromARGB(255, 179, 31, 20);
  static Color greyColor = Colors.black38;
  static Color kakiColor = const Color(0xFFd2bdb6);
  // static Color greenColor = const Color(0xff32ad6a);
  // static Color greyColor = const Color(0xffe5e9ec);

  //static double? toolbarHeight = IphoneHasNotch.hasNotch ? -12 : 0;

  static TextStyle smallText =
      const TextStyle(color: Colors.black, fontSize: 14);
  static TextStyle graySmallText =
      const TextStyle(color: Colors.grey, fontSize: 12);
  static TextStyle whiteText =
      const TextStyle(color: Colors.white, fontSize: 14);
  static TextStyle mediumText = const TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle largeText = const TextStyle(
      color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
  static TextStyle largeWhiteText = const TextStyle(
      color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700);

  static TextStyle textStyle =
      TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle1 =
      TextStyle(fontSize: 26, color: textColor, fontWeight: FontWeight.w900);
  static TextStyle headLineStyle2 =
      TextStyle(fontSize: 21, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 = TextStyle(
      fontSize: 17, color: Colors.grey.shade500, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle4 = TextStyle(
      fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.w500);

  BoxDecoration ContainerBoxDecoration =
      BoxDecoration(borderRadius: BorderRadius.circular(12));
}
