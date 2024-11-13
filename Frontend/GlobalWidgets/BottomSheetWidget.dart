import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MyCusomPainter.dart';

class Bottomsheetwidget extends StatelessWidget {
  final int id;
  const Bottomsheetwidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 120, // Adjust height as needed
      child: CustomPaint(
        size: Size(Get.width, (Get.width*0.3994910941475827).toDouble()),
        painter: id==1?BottomBar1():BottomBar2(),
        child: const Padding(
          padding: EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
