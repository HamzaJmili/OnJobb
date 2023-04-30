import 'package:get/get.dart';
import 'listenglishuk_item_model.dart';
import 'listchineses_item_model.dart';

class LanguageModel {
  Rx<List<ListenglishukItemModel>> listenglishukItemList =
      Rx(List.generate(3, (index) => ListenglishukItemModel()));

  Rx<List<ListchinesesItemModel>> listchinesesItemList =
      Rx(List.generate(6, (index) => ListchinesesItemModel()));
}
