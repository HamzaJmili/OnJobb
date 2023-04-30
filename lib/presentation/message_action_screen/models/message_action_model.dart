import 'package:get/get.dart';
import 'message_action_item_model.dart';

class MessageActionModel {
  Rx<List<MessageActionItemModel>> messageActionItemList =
      Rx(List.generate(4, (index) => MessageActionItemModel()));
}
