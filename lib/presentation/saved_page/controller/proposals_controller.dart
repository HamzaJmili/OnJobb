import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/models/proposal.dart';

class ProposalsScreenController extends GetxController {

  // List<Proposal> proposalsList = [];
 final RxList<Proposal> proposalsList = <Proposal>[].obs;


 Future<void> getProposals(String id) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('proposals')
      .where('jobId', isEqualTo: id)
      .get();

  for (var doc in snapshot.docs) {


    Proposal proposal = Proposal.fromJson(doc.id, doc.data());

 

    // Check if the proposal is already in the list
    bool alreadyExists = proposalsList.any((p) => p.id == proposal.id);
    if (alreadyExists) {
      print("Proposal already exists in the list");
    } else {
      proposalsList.add(proposal);
    }
  }

  print("Total number of proposals: ${proposalsList.length}");
}


  void setList(String id) async {
    await getProposals( id) ;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
