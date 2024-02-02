import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton/config/color_constants.dart';

TextStyle get kDefaultTextStyle {
  return GoogleFonts.poppins(
    // color: kBgBlack,
    color: kBgWhite,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
  // return GoogleFonts.nunito(
  //   color: kBgBlack,
  //   fontStyle: FontStyle.normal,
  //   fontWeight: FontWeight.normal,
  // );
}

const kNormalFontSize = 14.0;

const kDefaultCurve = Curves.easeInOutCirc;
const kDefaultFastDuration = Duration(milliseconds: 250);
const kDefaultDuration = Duration(milliseconds: 500);

const kDefaultScaffoldPadding = EdgeInsets.symmetric(horizontal: 10);

const kDefaultBorderRadius10 = BorderRadius.all(
  Radius.circular(10),
);
const kDefaultBorderRadius = BorderRadius.all(
  Radius.circular(5),
);

var a = GoogleFonts.playfairDisplay;

// var a = GoogleFonts.getFont(
//   data.value.fontFamily!,
//   textStyle: TextStyle(
//     fontSize: data.value.fontSize,
//     fontWeight: data.value.isBold ? FontWeight.bold : FontWeight.normal,
//     fontStyle: data.value.isItalic ? FontStyle.italic : FontStyle.normal,
//     decoration: data.value.isUnderline ? TextDecoration.underline : TextDecoration.none,
//     height: data.value.lineHeight,
//     // color: Color(data.value.hexColor),
//     color: hexToColor(data.value.hexColor),
//   ),
// );

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
     Path path_0 = Path();
    path_0.moveTo(size.width*0.0006182,size.height*0.0006866);
    path_0.cubicTo(size.width*0.1117334,size.height*0.0008660,size.width*0.2034824,size.height*0.0016731,size.width*0.2721203,size.height*0.0006667);
    path_0.cubicTo(size.width*0.2187884,size.height*0.0496638,size.width*0.2493298,size.height*0.1554306,size.width*0.1922149,size.height*0.2049858);
    path_0.cubicTo(size.width*0.1639564,size.height*0.2180397,size.width*0.1087331,size.height*0.2162460,size.width*0.0826433,size.height*0.2029928);
    path_0.cubicTo(size.width*0.0225662,size.height*0.1560086,size.width*0.0564829,size.height*0.0483883,size.width*0.0006182,size.height*0.0006866);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0009091, size.height * 0.0033333);
    path_0.lineTo(size.width * 0.4542455, size.height * -0.0033333);
    path_0.lineTo(size.width * 0.3175818, size.height * 0.3349833);
    path_0.lineTo(size.width * 0.1354545, size.height * 0.3316667);
    path_0.lineTo(size.width * -0.0009091, size.height * 0.0033333);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
