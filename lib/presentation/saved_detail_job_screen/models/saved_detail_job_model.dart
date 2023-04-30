import 'package:get/get.dart';
import 'listclock1_item_model.dart';
import 'listdescription1_item_model.dart';

class SavedDetailJobModel {
  Rx<List<Listclock1ItemModel>> listclock1ItemList =
      Rx(List.generate(3, (index) => Listclock1ItemModel()));

  Rx<List<Listdescription1ItemModel>> listdescription1ItemList =
      Rx(List.generate(3, (index) => Listdescription1ItemModel()));
}
