import 'package:bmi_calculator/core/constant/constant.dart';
import 'package:bmi_calculator/core/constant/gender.dart';
import 'package:bmi_calculator/core/controllers/main_controller.dart';
import 'package:bmi_calculator/view/widgets/adjustable_counter.dart';
import 'package:bmi_calculator/view/widgets/big_button.dart';
import 'package:bmi_calculator/view/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI CALCULATOR", style: kLabelTextStyle),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Row(
                children: [
                  GetBuilder<MainController>(
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          controller.setGender(Gender.male);
                        },
                        child: CustomCard(
                            content: Column(
                              children: [
                                Icon(
                                  male,
                                  size: 100,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "MALE",
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            isSlider: false,
                            active: controller.gender.value == Gender.male),
                      );
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GetBuilder<MainController>(
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          controller.setGender(Gender.female);
                        },
                        child: CustomCard(
                            content: Column(
                              children: [
                                Icon(
                                  female,
                                  size: 100,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "FEMALE",
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            isSlider: false,
                            active: controller.gender.value == Gender.female),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => CustomCard(
                  content: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("HEIGHT", style: kLabelTextStyle),
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              controller.height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              "cm",
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: .001,
                          activeTrackColor: Colors.white,
                          thumbColor: kBottomContainerColor,
                        ),
                        child: Slider(
                          value: controller.height.value.toDouble(),
                          onChanged: controller.setHeight,
                          min: 60,
                          max: 210,
                          // divisions: 1,
                          // activeColor: kBottomContainerColor,
                        ),
                      )
                    ],
                  ),
                  isSlider: true,
                  active: true)),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Obx(() => CustomCard(
                      content: AdjCounter(
                        title: "weight",
                        value: controller.weight.value,
                        addF: () {
                          controller.increaseWeight();
                        },
                        removeF: () {
                          controller.decreaseWeight();
                        },
                      ),
                      isSlider: false,
                      active: true)),
                  SizedBox(
                    width: 20,
                  ),
                  CustomCard(
                      content: Obx(() => AdjCounter(
                            title: "age",
                            addF: controller.increaseAge,
                            removeF: controller.decreaseAge,
                            value: controller.age.value,
                          )),
                      isSlider: false,
                      active: true),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BigButton(
                func: controller.calc,
              ),
            ]),
          ),
        ));
  }
}
