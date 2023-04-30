import '../controller/new_position_controller.dart';
import 'package:get/get.dart';

class NewPositionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewPositionController());
  }
}
