import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../api/storage.dart';
import '../utils/widgets/custom_text_field.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController logingController = Get.put(LoginController());

  final formey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
<<<<<<< HEAD
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'images/new_logo.png',
                          height: 120,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        /* child: Text(
=======
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350,
                decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/navyship.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'images/logo.png',
                          height: 120,
                        ),
                      ),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                         /* child: Text(
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504
                            //"WelCome TMS APPS !",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                            ),
                          ),*/
<<<<<<< HEAD
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'ইজিবাইক ম্যানেজমেন্ট সিস্টেম',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
=======
                        ),
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
<<<<<<< HEAD
                const SizedBox(height: 12),

                //const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: formey,
                            child: Column(
                              children: [
                                CustomTextField(
                                    initialValue: storage.read('isChecked') == true ? storage.read('userName') : logingController.emailController.value,
                                    hintText: 'User name',
                                    obscureText: false,
                                    onChanged: (value) {
                                      logingController.emailController.value = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email field is Required";
                                      }
                                      return null;
                                    }),
                                const SizedBox(
                                  height: 16,
                                ),
                                Obx(
                                  () => CustomTextField(
                                      initialValue: storage.read('isChecked') == true ? storage.read('password') : logingController.passwordController.value,
                                      obscureText: logingController.isVisible.value,
                                      hintText: 'password',
                                      isSuffixIcon: true,
                                      icon2: Obx(
                                        () => InkWell(
                                          onTap: () {
                                            logingController.visibilityToggle();
                                          },
                                          child: logingController.isVisible.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        logingController.passwordController.value = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Password is required";
                                        }
                                        return null;
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: storage.read("isChecked") ?? isRemembered,
                            onChanged: (value) {
                              setState(() {
                                storage.write('isChecked', value);
                                if (storage.read("isChecked") == true) {
                                  storage.write('userName', logingController.emailController.value);
                                  storage.write('password', logingController.passwordController.value);
                                }
                                isRemembered = !isRemembered;
                              });
                            },
                          ),
                          const Text('Remember me?'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                            minimumSize: Size(width * 0.88, 50),
                          ),
                          onPressed: () async {
                            if (formey.currentState!.validate()) {
                              if (logingController.emailController.isNotEmpty) {
                                storage.write('userName', logingController.emailController.value);
                              }
                              if (logingController.passwordController.isNotEmpty) {
                                storage.write('password', logingController.passwordController.value);
                              }
                              if (logingController.emailController.value.isEmpty && storage.read('userName') != null) {
                                setState(() {
                                  logingController.emailController.value = storage.read('userName');
                                });
                                print('>> email${storage.read('userName')}');
                              }
                              if (logingController.passwordController.value.isEmpty && storage.read('password') != null) {
                                setState(() {
                                  logingController.passwordController.value = storage.read('password');
                                });
                                print(logingController.passwordController.value);
                                print(">>> pass${storage.read('password')}");
                              }

                              await logingController.loginWithEmail();
                            }
                          },
                          child: Obx(() => logingController.isLoading.value
                              ? const SpinKitCircle(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Login'.toUpperCase(),
                                  style: const TextStyle(color: Colors.white, letterSpacing: 1.5),
                                )))
                    ],
                  ),
                )
              ],
            ),
=======
              ),
              //const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formey,
                          child: Column(
                            children: [
                              CustomTextField(
                                  initialValue: storage.read('isChecked') == true ? storage.read('userName') : logingController.emailController.value,
                                  hintText: 'User name',
                                  obscureText: false,
                                  onChanged: (value) {
                                    logingController.emailController.value = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email field is Required";
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 16,
                              ),
                              Obx(
                                    () => CustomTextField(
                                    initialValue: storage.read('isChecked') == true ? storage.read('password') : logingController.passwordController.value,
                                    obscureText: logingController.isVisible.value,
                                    hintText: 'password',
                                    isSuffixIcon: true,
                                    icon2: Obx(
                                          () => InkWell(
                                        onTap: () {
                                          logingController.visibilityToggle();
                                        },
                                        child: logingController.isVisible.value ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      logingController.passwordController.value = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Password is required";
                                      }
                                      return null;
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: storage.read("isChecked") ?? isRemembered,
                          onChanged: (value) {
                            setState(() {
                              storage.write('isChecked', value);
                              if (storage.read("isChecked") == true) {
                                storage.write('userName', logingController.emailController.value);
                                storage.write('password', logingController.passwordController.value);
                              }
                              isRemembered = !isRemembered;
                            });
                          },
                        ),
                        const Text('Remember me?'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                          minimumSize: Size(width * 0.88, 50),
                        ),
                        onPressed: () async {
                          if (formey.currentState!.validate()) {
                            if (logingController.emailController.isNotEmpty) {
                              storage.write('userName', logingController.emailController.value);
                            }
                            if (logingController.passwordController.isNotEmpty) {
                              storage.write('password', logingController.passwordController.value);
                            }
                            if (logingController.emailController.value.isEmpty && storage.read('userName') != null) {
                              setState(() {
                                logingController.emailController.value = storage.read('userName');
                              });
                              print('>> email${storage.read('userName')}');
                            }
                            if (logingController.passwordController.value.isEmpty && storage.read('password') != null) {
                              setState(() {
                                logingController.passwordController.value = storage.read('password');
                              });
                              print(logingController.passwordController.value);
                              print(">>> pass${storage.read('password')}");
                            }

                            await logingController.loginWithEmail();
                          }
                        },
                        child: Obx(() => logingController.isLoading.value
                            ? const SpinKitCircle(
                          color: Colors.white,
                        )
                            : Text(
                          'Login'.toUpperCase(),
                          style: const TextStyle(color: Colors.white, letterSpacing: 1.5),
                        )))
                  ],
                ),
              )
            ],
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504
          ),
        ));
  }
}
