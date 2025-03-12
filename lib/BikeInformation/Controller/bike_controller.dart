import 'package:get/get.dart';

import '../Model/bike_model.dart';
import '../Repository/bike_repositry.dart';


class BykeController extends GetxController {
  // var traineeNominationList = <TraineeNominationModel>[].obs;
  RxList<BikeInformation> bykeList = <BikeInformation>[].obs;
  var isLoading = false.obs;
 // var forTraineeNomiSearch=<BikeInformation>[].obs;

  getBykeData({String? scanValue}) async {
    isLoading.value = true;
    var response = await BykeRepo.bikeApiCall(scanValue: scanValue);
    bykeList.clear();
    //traineeNominationList.addAll(response);
    bykeList.value=response;

    isLoading.value = false;


  }


  @override
  void onInit() {
    getBykeData();
    super.onInit();
  }
}
