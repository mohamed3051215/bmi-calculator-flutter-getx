import 'package:bmi_calculator/core/constant/constant.dart';
import 'package:bmi_calculator/view/widgets/big_button.dart';
import 'package:bmi_calculator/view/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      required this.state,
      required this.bmi,
      required this.description})
      : super(key: key);
  final String state, bmi, description;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("Your Result : ", style: kLabelTextStyle),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CustomCard(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(state.toUpperCase(), style: kResultTextStyle),
                Text(bmi, style: kBMITextStyle),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(description, style: kResultBodyTextStyle),
                ),
              ],
            ),
            isSlider: true,
            active: true,
            height: 300,
          ),
          SizedBox(
            height: 20,
          ),
          BigButton(title: "OK", func: Get.back),
        ],
      ),
    );
  }
}
