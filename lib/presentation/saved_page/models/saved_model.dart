import 'package:get/get.dart';
import 'saved_item_model.dart';

class SavedModel {
  Rx<List<SavedItemModel>> savedItemList =
      Rx(List.generate(4, (index) => SavedItemModel()));
}
