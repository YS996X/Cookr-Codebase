import 'package:flutter/material.dart';


/// painter1 and painter2 size ==size: Size(Get.width, (Get.width*1.534351145038168).toDouble()),
class MyPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width,size.height*0.2365323);
    path_0.cubicTo(size.width,size.height*0.1907380,size.width*0.9430662,size.height*0.1536136,size.width*0.8728015,size.height*0.1536136);
    path_0.cubicTo(size.width*0.7059822,size.height*0.1536136,size.width*0.4237303,size.height*0.1536136,size.width*0.3320611,size.height*0.1536136);
    path_0.cubicTo(0,size.height*0.1536136,0,size.height*0.0008291874,0,size.height*0.0008291874);
    path_0.lineTo(0,size.height);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width,size.height*0.2365323);
    path_0.close();

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0,paint0Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.2365323);
    path_0.cubicTo(0,size.height*0.1907380,size.width*0.05693282,size.height*0.1536136,size.width*0.1271980,size.height*0.1536136);
    path_0.cubicTo(size.width*0.2940178,size.height*0.1536136,size.width*0.5762697,size.height*0.1536136,size.width*0.6679389,size.height*0.1536136);
    path_0.cubicTo(size.width,size.height*0.1536136,size.width,size.height*0.0008291874,size.width,size.height*0.0008291874);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.lineTo(0,size.height*0.2365323);
    path_0.close();

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0,paint0Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


///bootom

// //Add this CustomPaint widget to the Widget Tree
// CustomPaint(
///size: Size(Get.width, (Get.width*0.3994910941475827).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
// painter: RPSCustomPainter(),
// )
//Copy this CustomPainter code to the Bottom of the File
class BottomBar1 extends CustomPainter {
@override

void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(size.width,size.height*0.4762401);
path_0.cubicTo(size.width,size.height*0.4058854,size.width*0.9772188,size.height*0.3488516,size.width*0.9491120,size.height*0.3488516);
path_0.cubicTo(size.width*0.8111705,size.height*0.3488516,size.width*0.4336590,size.height*0.3488516,size.width*0.3320611,size.height*0.3488516);
path_0.cubicTo(size.width*-0.02798982,size.height*0.3488516,0,0,0,0);
path_0.lineTo(0,size.height);
path_0.lineTo(size.width,size.height);
path_0.lineTo(size.width,size.height*0.4762401);
path_0.close();

Paint paint0Fill = Paint()..style=PaintingStyle.fill;
paint0Fill.color = Colors.black;
canvas.drawPath(path_0,paint0Fill);
canvas.drawPath(path_0, paint0Fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}


// import 'dart:ui' as ui;
//
// //Add this CustomPaint widget to the Widget Tree
// CustomPaint(
// size: Size(WIDTH, (WIDTH*0.3994910941475827).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
// painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class BottomBar2 extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(0,size.height*0.4762401);
path_0.cubicTo(0,size.height*0.4058854,size.width*0.02278186,size.height*0.3488516,size.width*0.05088804,size.height*0.3488516);
path_0.cubicTo(size.width*0.1888293,size.height*0.3488516,size.width*0.5663410,size.height*0.3488516,size.width*0.6679389,size.height*0.3488516);
path_0.cubicTo(size.width*1.027990,size.height*0.3488516,size.width,0,size.width,0);
path_0.lineTo(size.width,size.height);
path_0.lineTo(0,size.height);
path_0.lineTo(0,size.height*0.4762401);
path_0.close();

Paint paint0Fill = Paint()..style=PaintingStyle.fill;
paint0Fill.color = Colors.black.withOpacity(1.0);
canvas.drawPath(path_0,paint0Fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}
