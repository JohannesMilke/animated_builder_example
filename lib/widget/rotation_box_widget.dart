import 'dart:math';

import 'package:flutter/material.dart';

class RotationBoxWidget extends StatefulWidget {
  @override
  _RotationBoxWidgetState createState() => _RotationBoxWidgetState();
}

class _RotationBoxWidgetState extends State<RotationBoxWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: animation,
          child: Container(color: Colors.red, width: 250, height: 250),
          builder: (context, child) => Transform.rotate(
            angle: animation.value,
            child: child,
          ),
        ),
      );
}
