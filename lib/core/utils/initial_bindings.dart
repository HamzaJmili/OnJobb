import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/core/network/network_info.dart';
import 'package:onjobb/core/utils/pref_utils.dart';
import 'package:onjobb/data/apiClient/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    // Get.put(ApiClient());
    // Connectivity connectivity = Connectivity();
    // Get.put(NetworkInfo(connectivity));
  }
}
