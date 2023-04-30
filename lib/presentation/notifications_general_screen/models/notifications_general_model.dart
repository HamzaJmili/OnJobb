import 'package:get/get.dart';
import 'listuser1_item_model.dart';

class NotificationsGeneralModel {
  Rx<List<Listuser1ItemModel>> listuser1ItemList =
      Rx(List.generate(4, (index) => Listuser1ItemModel()));
}
