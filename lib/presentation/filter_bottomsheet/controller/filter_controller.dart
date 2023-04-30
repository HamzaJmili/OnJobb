import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/filter_bottomsheet/models/filter_model.dart';

class FilterController extends GetxController {
  Rx<FilterModel> filterModelObj = FilterModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
