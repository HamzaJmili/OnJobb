
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/home_page/models/home_model.dart';
import 'package:onjobb/models/Client.dart';
import 'package:onjobb/models/Freelancer.dart';



class HomeController extends GetxController {

  HomeController(this.homeModelObj);
     final FirebaseAuth auth = FirebaseAuth.instance;
  Rx<bool> userisFreelancer = true.obs;
  Rx<Client?> client = Rx<Client?>(null);
  Rx<Freelancer?> freelancer = Rx<Freelancer?>(null);


 Future<void> getCurrentUser() async {
      try {
        User user = auth.currentUser!;
        DocumentReference userDocRef =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        final docSnapshot = await userDocRef.get();
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        print("${data['isFreelancer']}");
        if (data['isFreelancer'] == false) {
          print("the print inside if of if data is freelancer is false");
          client.value = Client.fromJson(data);
          userisFreelancer.value=false;
        } else if(data['isFreelancer']==true )  {
          print("the print inside if of if data is freelancer is true");
          freelancer.value = Freelancer.fromJson(data);

        userisFreelancer.value=true;
        }
      } catch (e) {
        print("print inside the catch of getuserController before print e ");
        print(e);
      }
     
    }







  Rx<HomeModel> homeModelObj;


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
