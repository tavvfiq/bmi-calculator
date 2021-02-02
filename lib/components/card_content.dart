import 'package:bmi/components/card_button.dart';
import 'package:bmi/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardContentProps {
  CardContentProps(
      {this.label,
      this.unit,
      this.icon,
      this.increase,
      this.decrease,
      this.value,
      this.onChange});

  Function decrease;
  IconData icon;
  Function increase;
  String label;
  Function onChange;
  String unit;
  int value;
}

Widget cardContentFactory({String cardType, CardContentProps props}) {
  if (cardType == "withIcon") {
    return WithIcon(props: props);
  } else if (cardType == "withButton") {
    return WithButton(props: props);
  } else if (cardType == "withSlider") {
    return WithSlider(props: props);
  }
  return null;
}

class WithIcon extends StatelessWidget {
  WithIcon({this.props});

  final CardContentProps props;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.props.icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(this.props.label, style: kLabelStyle)
      ],
    );
  }
}

class WithButton extends StatelessWidget {
  WithButton({this.props});

  final CardContentProps props;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(this.props.label, style: kLabelStyle),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${this.props.value}",
              style: kNumberStyle,
            ),
            Text(
              this.props.unit,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardButton(
              icon: FontAwesomeIcons.minus,
              onPress: this.props.decrease,
            ),
            SizedBox(width: 10.0),
            CardButton(
              icon: FontAwesomeIcons.plus,
              onPress: this.props.increase,
            ),
          ],
        )
      ],
    );
  }
}

class WithSlider extends StatelessWidget {
  WithSlider({this.props});

  final CardContentProps props;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(this.props.label, style: kLabelStyle),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${this.props.value}",
              style: kNumberStyle,
            ),
            Text(
              this.props.unit,
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            overlayColor: Color(0x29EB1555),
            thumbColor: Color(0xFFEB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          ),
          child: Slider(
              value: this.props.value.toDouble(),
              inactiveColor: Color(0xFF8D8E98),
              onChanged: (value) {
                this.props.onChange(value.toInt());
              },
              min: 0,
              max: 200.0),
        )
      ],
    );
  }
}
