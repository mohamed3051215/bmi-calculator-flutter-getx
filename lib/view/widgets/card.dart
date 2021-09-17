import 'package:bmi_calculator/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      required this.content,
      required this.isSlider,
      required this.active,
      this.height})
      : super(key: key);
  final Widget content;
  final bool isSlider;
  final bool active;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: !active ? kInactiveCardColor : kActiveCardColor,
            borderRadius: BorderRadius.circular(15)),
        width: !isSlider ? (Get.width - 60) / 2 : Get.width,
        height: height == null ? 150 : height,
        child: content);
  }
}
