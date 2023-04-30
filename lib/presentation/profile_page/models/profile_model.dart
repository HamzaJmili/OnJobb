import 'package:get/get.dart';
import 'chipviewskills_one_item_model.dart';
import 'profile_item_model.dart';

class ProfileModel {
  Rx<List<ChipviewskillsOneItemModel>> chipviewskillsOneItemList =
      Rx(List.generate(8, (index) => ChipviewskillsOneItemModel()));

  Rx<List<ProfileItemModel>> profileItemList =
      Rx(List.generate(3, (index) => ProfileItemModel()));
}
