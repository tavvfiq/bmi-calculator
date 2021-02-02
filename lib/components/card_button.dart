import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  CardButton({this.icon, this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 2.0,
      constraints: BoxConstraints.tightFor(
        width: 52.0,
        height: 52.0,
      ),
      onPressed: this.onPress,
      child: Icon(this.icon),
    );
  }
}
