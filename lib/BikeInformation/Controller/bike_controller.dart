<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
=======
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504
import 'package:get/get.dart';

import '../Model/bike_model.dart';
import '../Repository/bike_repositry.dart';

<<<<<<< HEAD
=======

>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504
class BykeController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  RxList<BikeInformation> bykeList = <BikeInformation>[].obs;
  var isLoading = false.obs;
<<<<<<< HEAD

  var regNumberController = TextEditingController().obs;
  // var forTraineeNomiSearch=<BikeInformation>[].obs;
=======
 // var forTraineeNomiSearch=<BikeInformation>[].obs;
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504

  getBykeData({String? scanValue}) async {
    isLoading.value = true;
    var response = await BykeRepo.bikeApiCall(scanValue: scanValue);
    bykeList.clear();
    //traineeNominationList.addAll(response);
<<<<<<< HEAD
    bykeList.value = response;

    isLoading.value = false;
  }

  @override
  void onInit() {
=======
    bykeList.value=response;

    isLoading.value = false;


  }


  @override
  void onInit() {
    getBykeData();
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504
    super.onInit();
  }
}
