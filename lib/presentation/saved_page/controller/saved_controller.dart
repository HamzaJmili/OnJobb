import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/saved_page/models/saved_model.dart';

class SavedController extends GetxController {
  SavedController(this.savedModelObj);

  Rx<SavedModel> savedModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
