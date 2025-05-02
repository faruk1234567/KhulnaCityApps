import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kh_city/BikeInformation/Controller/bike_controller.dart';
import 'package:kh_city/api/Bn_Urls.dart';

import '../../BikeInformation/Model/bike_model.dart';
import '../../Splash/splash_screen.dart';
import '../../api/Bn_AppRoutes.dart';
import '../../api/storage.dart';

import '../LoginService/login_Screen.dart';

class HomeScreen extends StatelessWidget {
  void logout(BuildContext context) {
    storage.write('token', null); // Invalidate token
    Get.offAllNamed(AppRoutes.login); // Pop until reaching the root navigator
  }

  final BykeController controller = Get.put(BykeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// resizeToAvoidBottomInset: false,

      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('...', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          InkWell(
              onTap: () {
                logout(context);
              },
              child: Tooltip(
                  message: "Course Details",
                  textStyle: const TextStyle(color: Colors.red),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      color: Colors.white,
                      height: 60,
                      child: Image.asset(
                        'images/logout1.jpg',
                      ),
                    ),
                  )))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller.regNumberController.value,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: () async {
                      if (controller.regNumberController.value.text.isNotEmpty) {
                        await controller.getBykeData(scanValue: controller.regNumberController.value.text);
                      }
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                const SizedBox(width: 6),
              ],
            ),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : controller.bykeList.isEmpty
                ? Container(
              padding: const EdgeInsets.only(top: 50),
              child: const Text(
                'NOT FOUND',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
                : Container(
              padding: const EdgeInsets.only(left: 6),
              child: Column(
                children: [
                  const Divider(thickness: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "রেজি : নং : ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList[0].registrationNo.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "RFID নং : ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList[0].rfidNo.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "নাম: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList[0].ownerFullName.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "পিতার নাম: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList[0].fatherName.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "এন আই ডি নং: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList[0].nidNo.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ওয়ার্ল্ড নং: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList[0].wordName.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ফোন নং: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList[0].contactNo.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "অর্থ বছর: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList.isNotEmpty && controller.bykeList[0].fiscalYearName != null
                              ? controller.bykeList[0].fiscalYearName.toString()
                              : '',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "সর্বমোট বকেয়া বছর : ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList.isNotEmpty && controller.bykeList[0].dueYear != null
                              ? controller.bykeList[0].dueYear.toString()
                              : '',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "সর্বমোট বকেয়া : ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList.isNotEmpty && controller.bykeList[0].dueAmount != null
                              ? controller.bykeList[0].dueAmount.toString()
                              : '',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "বর্তমান ঠিকানা: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList[0].presentAddress.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "স্থায়ী ঠিকানা: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          controller.bykeList[0].presentAddress.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Obx(() {
                    if (controller.bykeList.isNotEmpty) {
                      return buildBikeImage(controller.bykeList[0]);
                    } else {
                      return const Text("No bike data");
                    }
                  }),
                  //SizedBox(height: 200, child: ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network(Urls.imageUrl + controller.bykeList[0].imagePath!))),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget itemDashboard(
      String title,
      IconData iconData,
      Color background,
      ) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 2),
                color: Colors.blue,

                //color: Theme.of(context)
                //.primaryColor
                //.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
            // style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );
}
Widget buildBikeImage(BikeInformation bike) {
  if (bike.imagePath != null && bike.imagePath!.isNotEmpty) {
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          Urls.imageUrl + bike.imagePath!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text('Image load failed'));
          },
        ),
      ),
    );
  } else {
    return const SizedBox(
      height: 200,
      child: Center(child: Text("No image available")),
    );
  }
}


Widget _buildCard(BuildContext context, String title, IconData icon, {VoidCallback? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Card(
      elevation: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: Colors.blue.shade900,
          ),
          const SizedBox(height: 4),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    ),
  );
}
