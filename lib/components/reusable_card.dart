import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.child, this.color, this.onPress});

  final Widget child;
  final Color color;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(10.0),
        height: 200.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: this.color,
        ),
      ),
    );
  }
}
