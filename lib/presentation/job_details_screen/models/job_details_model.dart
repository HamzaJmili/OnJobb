import 'package:get/get.dart';
import 'listclock_item_model.dart';
import 'listdescription_item_model.dart';

class JobDetailsModel {
  Rx<List<ListclockItemModel>> listclockItemList =
      Rx(List.generate(3, (index) => ListclockItemModel()));

  Rx<List<ListdescriptionItemModel>> listdescriptionItemList =
      Rx(List.generate(3, (index) => ListdescriptionItemModel()));
}
