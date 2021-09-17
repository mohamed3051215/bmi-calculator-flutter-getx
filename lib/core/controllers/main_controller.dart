import 'package:bmi_calculator/core/constant/gender.dart';
import 'package:bmi_calculator/core/functionality/bmi_calculator.dart';
import 'package:bmi_calculator/view/widgets/custom_dialog.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final Rx<Gender> gender = Gender.male.obs;
  final RxInt height = 170.obs;
  final RxInt weight = 60.obs;
  final RxInt age = 25.obs;

  setGender(Gender genderX) {
    gender.value = genderX;
    update();
  }

  setHeight(double? heightX) {
    height.value = heightX!.toInt();
    update();
  }

  increaseWeight() {
    weight.value++;
  }

  decreaseWeight() {
    weight.value--;
    // update();
  }

  increaseAge() {
    age.value++;
    update();
  }

  decreaseAge() {
    age.value--;
    update();
  }

  calc() {
    CalculatorBrain calc =
        CalculatorBrain(height: height.value, weight: weight.value);
    final String state = calc.getResult();
    final String bmi = calc.calculateBMI();
    final String description = calc.getInterpretation();
    Get.dialog(CustomDialog(state: state, bmi: bmi, description: description));
  }
}
