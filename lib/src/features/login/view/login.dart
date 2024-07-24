import 'dart:convert';
import 'dart:developer';
import 'package:absensi_riverpod/src/features/login/repository/login_repository.dart';
import 'package:crypto/crypto.dart';
import 'package:absensi_riverpod/src/model/user.dart';
import 'package:absensi_riverpod/src/shared/elevated_button.dart';
import 'package:absensi_riverpod/src/shared/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/config/const.dart';
import '../../../global/controller/shared_prefs_controller.dart';
import '../../../global/repository/shared_prefs_repo.dart';
import '../../../routes/app_pages.dart';
import '../controller/login.dart';

class Login extends ConsumerWidget {
  Login({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(sharedPrefsControllerPovider);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/bgapp.jpg'),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                SizedBox(
                  width: 450,
                  height: 220,
                  // child: Rive(artboard: controller.artboard.value),
                ),
                const SizedBox(height: 5),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: 395,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: blue),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Form(
                            key: formKey,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CsTexFormField(
                                  label: 'Username',
                                  obscure: false,
                                  icon: const Icon(Icons.person_sharp),
                                  // helperText: 'Your username',
                                  validator: (value) => value!.isEmpty
                                      ? 'Please enter your username'
                                      : null,
                                  onChanged: (value) {
                                    log(value);
                                    ref.read(sharedPrefsRepoProvider).username =
                                        value;
                                    return formKey.currentState!.validate();
                                  },
                                ),
                                CsTexFormField(
                                  label: 'Password',
                                  obscure: true,
                                  icon: const Icon(Icons.key),
                                  // helperText: 'Your password',
                                  validator: (value) => value!.isEmpty
                                      ? 'Please enter your password'
                                      : null,
                                  onChanged: (value) {
                                    log(value);
                                    ref.read(sharedPrefsRepoProvider).password =
                                        value;
                                    return formKey.currentState!.validate();
                                  },
                                ),
                                // const SizedBox(height: 12),
                                // CsElevatedButton(
                                //     onPressed: () {
                                //       if (formKey.currentState!.validate()) {
                                //         // context.go(RoutesPath.home);

                                //         //  userData.getUser().then((value) async {
                                //         //   if (value != null) {
                                //         //     // print(value);
                                //         //   } else {
                                //         //     await userData.setUser(
                                //         //         user: User(
                                //         //             username:
                                //         //                 ref.read(sharedPrefsRepoProvider).username,
                                //         //             password: ref
                                //         //                 .read(sharedPrefsRepoProvider)
                                //         //                 .password));
                                //         //   }
                                //         // }
                                //         // );
                                //         ref.read(loginAuthController).login(
                                //             context: context,
                                //             username: ref
                                //                 .read(sharedPrefsRepoProvider)
                                //                 .username,
                                //             password: ref
                                //                 .read(sharedPrefsRepoProvider)
                                //                 .password);
                                //         userData.setCookie(
                                //             cookie: ref
                                //                 .read(sharedPrefsRepoProvider)
                                //                 .getRandomString(50)
                                //                 .toString());
                                //       }
                                //     },
                                //     label: 'Login'),
                              ],
                            ),
                          ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  // backgroundColor: AppColors.contentDefBtn,
                                  fixedSize: const Size(130, 45)),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  ref
                                      .read(loginAuthController)
                                      .login(
                                          context: context,
                                          username: ref
                                              .read(sharedPrefsRepoProvider)
                                              .username,
                                          password: ref
                                              .read(sharedPrefsRepoProvider)
                                              .password)
                                      .then((value) {
                                    if (value != null) {
                                      print(value.data!);
                                      // ref
                                      //     .read(sharedPrefsControllerPovider)
                                      //     .setUser(
                                      //         user: User(
                                      //             username:
                                      //                 value.data!.username,
                                      //             password:
                                      //                 value.data!.password));
                                      context.go(RoutesPath.home);
                                    }
                                  });
                                }

                                // controller.isChecking?.change(false);
                                // controller.isHandsUp?.change(false);
                                // if (controller.username.text != "" &&
                                //     controller.password.text != "") {
                                //   controller.login();
                                //   controller.successTrigger?.fire();
                                // } else {
                                //   controller.failTrigger?.fire();
                                // }
                              },
                              child: const Text(
                                'LOGIN',
                                // style:
                                //     TextStyle(color: AppColors.mainTextColor1),
                              )),
                          const SizedBox(height: 20),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  // Get.to(() => VerifikasiUpdatePassword(),
                                  //     transition: Transition.cupertino);
                                },
                                child: Text(
                                  'Lupas Password?',
                                  style: TextStyle(color: blue),
                                )),
                          ),
                          Center(
                            child: RichText(
                                text: TextSpan(
                                    text: 'Belum punya akun? ',
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.bold),
                                    children: [
                                  TextSpan(
                                    text: 'klik disini',
                                    style: TextStyle(
                                        color: blue,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.bold),
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () {
                                    //     // Aksi yang dijalankan saat TextButton diklik
                                    //     Get.toNamed('/add-pegawai');
                                    //   }
                                  )
                                ])),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  // var databasesPath = await getDatabasesPath();
                                  // // var dbPath = join(databasesPath, 'penjualan.db');

                                  // var status = await Permission
                                  //     .manageExternalStorage.status;
                                  // if (!status.isGranted) {
                                  //   await Permission.manageExternalStorage
                                  //       .request();
                                  // }

                                  // var status1 = await Permission.storage.status;
                                  // if (!status1.isGranted) {
                                  //   await Permission.storage.request();
                                  // }

                                  // try {
                                  //   File savedDb = File(
                                  //       "/storage/emulated/0/URBANCO SPOT/absensi.db");

                                  //   await savedDb
                                  //       .copy('$databasesPath/absensi.db');
                                  // } catch (e) {
                                  //   showToast(e.toString());
                                  // }

                                  // showToast('Successfully Restored Database');
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.restore_rounded,
                                      color: blue,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Restore Database',
                                      style: TextStyle(
                                          color: blue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

    // Scaffold(
    //   backgroundColor: Colors.blue,
    //   body: Container(
    //     padding: const EdgeInsets.all(20),
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height/2,
    //     decoration: const BoxDecoration(
    //       color: Colors.white),
    //     child: Form(
    //       key: formKey,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           CsTexFormField(
    //             label: 'Username',
    //             obscure: false,
    //             icon: const Icon(Icons.person_sharp),
    //             helperText: 'Your username',
    //             validator: (value) =>
    //                 value!.isEmpty ? 'Please enter your username' : null,
    //             onChanged: (value) {
    //               log(value);
    //               ref.read(sharedPrefsRepoProvider).username = value;
    //               return formKey.currentState!.validate();
    //             },
    //           ),
    //           CsTexFormField(
    //             label: 'Password',
    //             obscure: true,
    //             icon: const Icon(Icons.key),
    //             helperText: 'Your password',
    //             validator: (value) =>
    //                 value!.isEmpty ? 'Please enter your password' : null,
    //             onChanged: (value) {
    //               log(value);
    //               ref.read(sharedPrefsRepoProvider).password = value;
    //               return formKey.currentState!.validate();
    //             },
    //           ),
    //           const SizedBox(height: 12),
    //           CsElevatedButton(
    //               onPressed: () {
    //                 if (formKey.currentState!.validate()) {
    //                   // context.go(RoutesPath.home);

    //                   //  userData.getUser().then((value) async {
    //                   //   if (value != null) {
    //                   //     // print(value);
    //                   //   } else {
    //                   //     await userData.setUser(
    //                   //         user: User(
    //                   //             username:
    //                   //                 ref.read(sharedPrefsRepoProvider).username,
    //                   //             password: ref
    //                   //                 .read(sharedPrefsRepoProvider)
    //                   //                 .password));
    //                   //   }
    //                   // }
    //                   // );
    //                   ref.read(loginAuthController).login(
    //                       context: context,
    //                       username: ref.read(sharedPrefsRepoProvider).username,
    //                       password: ref.read(sharedPrefsRepoProvider).password);
    //                   userData.setCookie(
    //                       cookie: ref
    //                           .read(sharedPrefsRepoProvider)
    //                           .getRandomString(50)
    //                           .toString());
    //                 }
    //               },
    //               label: 'Login'),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}