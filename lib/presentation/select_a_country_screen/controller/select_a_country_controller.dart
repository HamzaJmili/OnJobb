import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/select_a_country_screen/models/select_a_country_model.dart';
import 'package:flutter/material.dart';

class SelectACountryController extends GetxController {
TextEditingController frameOneController = TextEditingController();

Rx<SelectACountryModel> selectACountryModelObj = SelectACountryModel().obs;

Rx<String> radioGroup = "".obs;

var filteredCountryList = [].obs;
var searchText = "".obs;

List<String> countryList = [
"Afghanistan",
"Albania",
"Algeria",
"Argentina",
"Australia",
"Austria",
"Bangladesh",
"Belgium",
"Bolivia",
"Brazil",
"Bulgaria",
"Canada",
"Chile",
"China",
"Colombia",
"Costa Rica",
"Croatia",
"Cuba",
"Cyprus",
"Czech Republic",
"Denmark",
"Dominican Republic",
"Ecuador",
"Egypt",
"El Salvador",
"Estonia",
"Finland",
"France",
"Germany",
"Greece",
"Guatemala",
"Honduras",
"Hungary",
"Iceland",
"India",
"Indonesia",
"Iran",
"Iraq",
"Ireland",
"Israel",
"Italy",
"Jamaica",
"Japan",
"Jordan",
"Kazakhstan",
"Kenya",
"Kuwait",
"Latvia",
"Lebanon",
"Libya",
"Liechtenstein",
"Lithuania",
"Luxembourg",
"Malaysia",
"Maldives",
"Malta",
"Mexico",
"Monaco",
"Mongolia",
"Montenegro",
"Morocco",
"Nepal",
"Netherlands",
"New Zealand",
"Nicaragua",
"Nigeria",
"North Korea",
"Norway",
"Oman",
"Pakistan",
"Panama",
"Paraguay",
"Peru",
"Philippines",
"Poland",
"Portugal",
"Qatar",
"Romania",
"Russia",
"Saudi Arabia",
"Serbia",
"Singapore",
"Slovakia",
"Slovenia",
"South Africa",
"South Korea",
"Spain",
"Sri Lanka",
"Sweden",
"Switzerland",
"Syria",
"Taiwan",
"Thailand",
"Trinidad and Tobago",
"Tunisia",
"Turkey",
"Ukraine",
"United Arab Emirates",
"United Kingdom",
"United States",
"Uruguay",
"Uzbekistan",
"Venezuela",
"Vietnam",
"Yemen",
"Zambia",
"Zimbabwe"
];

@override
void onInit() {
super.onInit();
filteredCountryList.value = countryList;
searchText.listen((value) {
filterList(value);
});
frameOneController.addListener(() {
    filterList(frameOneController.text);
  });
}

filterList(String value) {
if (value.isEmpty) {
filteredCountryList.value = countryList;
return;
}
filteredCountryList.value = countryList
.where((country) =>
country.toLowerCase().contains(value.toLowerCase()))
.toList();
}



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    frameOneController.dispose();
  }

  }