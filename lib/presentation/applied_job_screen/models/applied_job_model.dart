import 'package:get/get.dart';
import 'listclock2_item_model.dart';
import 'listdescription2_item_model.dart';

class AppliedJobModel {
  Rx<List<Listclock2ItemModel>> listclock2ItemList =
      Rx(List.generate(3, (index) => Listclock2ItemModel()));

  Rx<List<Listdescription2ItemModel>> listdescription2ItemList =
      Rx(List.generate(3, (index) => Listdescription2ItemModel()));
}
