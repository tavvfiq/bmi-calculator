import 'package:bmi/components/card_content.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int age = 20;
  List<CardContentProps> contentWithIcon = [
    CardContentProps(icon: FontAwesomeIcons.mars, label: "MALE"),
    CardContentProps(icon: FontAwesomeIcons.venus, label: "FEMALE")
  ];

  num height = 0;
  int selectedGender = 0;
  int weight = 50;

  void changeGender(int gender) {
    // 0 = MALE, 1 = FEMALE
    setState(() {
      selectedGender = gender;
    });
  }

  void changeHeight(int value) {
    setState(() {
      height = value;
    });
  }

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  void decreaseWeight() {
    setState(() {
      if (weight <= 0) {
        weight = 0;
      } else {
        weight--;
      }
    });
  }

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  void decreaseAge() {
    setState(() {
      if (age <= 0) {
        age = 0;
      } else {
        age--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.sort),
            Text("BMI CALCULATOR"),
            SizedBox(),
          ],
        ),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: contentWithIcon.asMap().entries.map(
              (item) {
                return Expanded(
                  child: ReusableCard(
                    onPress: () {
                      changeGender(item.key);
                    },
                    color: selectedGender == item.key
                        ? kActiveColor
                        : kInActiveColor,
                    child: cardContentFactory(
                      cardType: "withIcon",
                      props: item.value,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveColor,
              child: cardContentFactory(
                props: CardContentProps(
                  label: "HEIGHT",
                  unit: "cm",
                  value: height,
                  onChange: changeHeight,
                ),
                cardType: "withSlider",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ReusableCard(
                  color: kActiveColor,
                  child: cardContentFactory(
                    props: CardContentProps(
                        label: "WEIGHT",
                        unit: "kg",
                        value: weight,
                        increase: increaseWeight,
                        decrease: decreaseWeight),
                    cardType: "withButton",
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveColor,
                  child: cardContentFactory(
                    props: CardContentProps(
                        label: "AGE",
                        unit: "yrs",
                        value: age,
                        increase: increaseAge,
                        decrease: decreaseAge),
                    cardType: "withButton",
                  ),
                ),
              )
            ],
          ),
          RawMaterialButton(
            fillColor: Colors.red,
            constraints: BoxConstraints.tightFor(
              width: double.infinity,
              height: 56.0,
            ),
            onPressed: () {},
            child: Text(
              "CALCULATE",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
