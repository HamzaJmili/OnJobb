import 'package:get/get.dart';
import 'listlocation_item_model.dart';

class NotificationsMyProposalsModel {
  Rx<List<ListlocationItemModel>> listlocationItemList =
      Rx(List.generate(3, (index) => ListlocationItemModel()));
}
