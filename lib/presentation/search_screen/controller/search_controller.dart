import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/search_screen/models/search_model.dart';

class SearchController extends GetxController {
  Rx<SearchModel> searchModelObj = SearchModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
