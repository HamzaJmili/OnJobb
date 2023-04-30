import 'package:get/get.dart';
import 'slidermessage_item_model.dart';

class OnboardingTwoModel {
  Rx<List<SlidermessageItemModel>> slidermessageItemList =
      Rx(List.generate(1, (index) => SlidermessageItemModel()));
}
