import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_healthapp/model/Doctor_list.dart';


class DoctorController extends GetxController {
  var doctors = <Doctor>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void fetchDoctors() {
    FirebaseFirestore.instance.collection('doctors').snapshots().listen((snapshot) {
      doctors.value = snapshot.docs.map((doc) {
        return Doctor.fromFirestore(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
      isLoading.value = false;
    }, onError: (error) {
      Get.snackbar("Error", error.toString());
      isLoading.value = false;
    });
  }
}
