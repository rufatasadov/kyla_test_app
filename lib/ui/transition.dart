import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTransition extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyTransition>     with TickerProviderStateMixin {

  double x = 0;
  double y = 0;
  double z = 0;
  double sc = 1;
  late AnimationController _controller;
  late Animation animation;

@override
  void initState() {
    super.initState();
  _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    ); 

    animation =  Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
         transform: Matrix4(
              1,0,0,x,
              0,1,0,0,
              0,0,1,0,
              0,0,0,1,
          )..rotateX(x)..rotateY(y)..rotateZ(z),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onTap: () {
              // _controller.animateTo(0.001);
              setState(() {
                x = 0.001;
                y = 0;
                z = 0;
                sc = 1;
                
             //   y =  animation.value;
              //  x = x + animation.value;
              });
            },
            child: Container(
              color: Colors.red,
              height: 200.0,
              width: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}