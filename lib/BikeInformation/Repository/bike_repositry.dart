
import 'package:dio/dio.dart' as dio;

import '../../api/Bn_Urls.dart';
import '../../api/base_client.dart';
import '../Model/bike_model.dart';


class BykeRepo {
  static Future<List<BikeInformation>> bikeApiCall({String ? scanValue}) async {
    try {
      dio.Response response = await BaseClient.get(url: Urls.bikeUrl + scanValue.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        List<BikeInformation> bykeInfo = [];
        List list = response.data;

        for (var i in list) {
          bykeInfo.add(BikeInformation.fromJson(i));
        }
        return bykeInfo;
      } else {
        print("${response.statusCode}");
      }
      throw "${response.statusMessage}";
    } catch (e) {
      rethrow;
    }
  }
}
