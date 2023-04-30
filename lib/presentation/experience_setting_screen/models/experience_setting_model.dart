import 'package:get/get.dart';
import 'listuser2_item_model.dart';

class ExperienceSettingModel {
  Rx<List<Listuser2ItemModel>> listuser2ItemList =
      Rx(List.generate(3, (index) => Listuser2ItemModel()));
}
