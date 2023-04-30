import 'package:get/get.dart';
import 'chipviewjobs_one_item_model.dart';

class FilterModel {
  Rx<List<ChipviewjobsOneItemModel>> chipviewjobsOneItemList =
      Rx(List.generate(2, (index) => ChipviewjobsOneItemModel()));
}
