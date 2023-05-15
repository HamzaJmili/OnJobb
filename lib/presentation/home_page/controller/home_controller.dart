
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/home_page/models/home_model.dart';


class HomeController extends GetxController {
  HomeController(this.homeModelObj);







  Rx<HomeModel> homeModelObj;
//  Future<Freelancer> getCurrentUser() async {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     User user = await auth.currentUser!;
//     DocumentReference userDocRef =
//         FirebaseFirestore.instance.collection('users').doc(user.uid);
//     final docSnapshot = await userDocRef.get();
//     var freelancer = Freelancer.fromDocumentSnapshot(docSnapshot);
//     return freelancer;
//   }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
