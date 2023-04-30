import 'package:get/get.dart';
import 'listuser_item_model.dart';
import 'listgroup_item_model.dart';

class HomeModel {
  Rx<List<ListuserItemModel>> listuserItemList =
      Rx(List.generate(2, (index) => ListuserItemModel()));

  Rx<List<ListgroupItemModel>> listgroupItemList =
      Rx(List.generate(2, (index) => ListgroupItemModel()));
}
