import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../Splash/splash_screen.dart';
import '../../api/Bn_AppRoutes.dart';
import '../../api/storage.dart';

import '../LoginService/login_Screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    void logout(BuildContext context) {
      storage.write('token', null); // Invalidate token
      Get.offAllNamed(AppRoutes.login); // Pop until reaching the root navigator
    }



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /// resizeToAvoidBottomInset: false,

        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Welcome TMS Dashbord', style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  logout(context);
                },
                child: Tooltip(
                    message: "Course Details",
                    textStyle: const TextStyle(color: Colors.red),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
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

        body: ListView(
          //padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                // alignment: Alignment.centerLeft,

                //height: MediaQuery.of(context).size.height / 2.22,
                width: MediaQuery.of(context).size.width / 2.62,
                /*decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),*/

              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 4,
                  color: Colors.blue,
                )
              ],
            ),

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
              style: TextStyle(
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


