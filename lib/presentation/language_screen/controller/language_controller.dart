import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/language_screen/models/language_model.dart';

class LanguageController extends GetxController {
  Rx<LanguageModel> languageModelObj = LanguageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
