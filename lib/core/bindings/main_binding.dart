import 'package:bmi_calculator/core/controllers/main_controller.dart';
import 'package:get/instance_manager.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
