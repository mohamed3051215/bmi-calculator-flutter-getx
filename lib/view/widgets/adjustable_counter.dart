import 'package:bmi_calculator/core/constant/constant.dart';
import 'package:flutter/material.dart';

class AdjCounter extends StatelessWidget {
  AdjCounter(
      {Key? key,
      required this.value,
      required this.title,
      required this.addF,
      required this.removeF})
      : super(key: key);
  final int value;
  final String title;
  final addF, removeF;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          title.toUpperCase(),
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              child: RawMaterialButton(
                onPressed: () => addF(),
                child: Icon(add),
                fillColor: Color(0xFF4C4F5E),
                shape: CircleBorder(),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              child: RawMaterialButton(
                onPressed: () {
                  removeF();
                },
                child: Icon(minus),
                fillColor: Color(0xFF4C4F5E),
                shape: CircleBorder(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
