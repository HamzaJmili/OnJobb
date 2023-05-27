import 'package:get/get.dart';
import 'package:onjobb/data/models/selectionPopupModel/selection_popup_model.dart';

class AddNewEducationModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Bachelor",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Master",
    ),
    SelectionPopupModel(
      id: 3,
      title: "PhD",
    )
  ]);

  Rx<DateTime>? selectedSmalllabelregulTwoTxt = Rx(DateTime.now());

  Rx<String> smalllabelregulTwoTxt = Rx("");

  Rx<DateTime>? selectedSmalllabelregulThreeTxt = Rx(DateTime.now());

  Rx<String> smalllabelregulThreeTxt = Rx("");
}
