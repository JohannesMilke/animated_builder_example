import 'package:flutter/material.dart';

class TransformBoxWidget extends StatefulWidget {
  @override
  _TransformBoxWidgetState createState() => _TransformBoxWidgetState();
}

class _TransformBoxWidgetState extends State<TransformBoxWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> sizeAnimation;
  Animation<BorderRadius> radiusAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();

    final curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.ease);

    sizeAnimation = Tween<double>(begin: 50, end: 250).animate(curvedAnimation);
    radiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(60),
      end: BorderRadius.circular(16),
    ).animate(curvedAnimation);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Container(
            width: sizeAnimation.value,
            height: sizeAnimation.value,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: radiusAnimation.value,
            ),
          ),
        ),
      );
}
