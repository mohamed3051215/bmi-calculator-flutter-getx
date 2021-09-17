import 'package:bmi_calculator/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BigButton extends StatelessWidget {
  const BigButton({Key? key, this.title = "calulate bmi", this.func})
      : super(key: key);
  final String title;
  final Function? func;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: kBottomContainerHeight,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(kBottomContainerColor)),
          onPressed: () {
            func == null ? print("function is null") : func!();
          },
          child: Text(title.toUpperCase(), style: kResultBodyTextStyle),
        ));
  }
}
