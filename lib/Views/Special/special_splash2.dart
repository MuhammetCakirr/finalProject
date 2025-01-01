import 'dart:async';

import 'package:finalprojectapp/Views/Special/special_jobs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Components/app_bar.dart';
import '../../Components/navigation_bar.dart';

class SpecialSplash2 extends StatefulWidget  {
  const SpecialSplash2({super.key});

  @override
  State<SpecialSplash2> createState() => _SpecialSplash2State();
}

class _SpecialSplash2State extends State<SpecialSplash2> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SpecialJobs()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(userName: "Muhammet İkbal", isSettingsPage: true,),
          body: Stack(
            children: [
              DraggableScrollableSheet(
                initialChildSize: (MediaQuery.of(context).size.height - 10) /
                    MediaQuery.of(context).size.height,
                minChildSize: (MediaQuery.of(context).size.height - 10) /
                    MediaQuery.of(context).size.height,
                maxChildSize: (MediaQuery.of(context).size.height - 10) /
                    MediaQuery.of(context).size.height,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: Colors.white,
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [



                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left:  30.0),
                            child: Column(
                              children: [
                                Lottie.asset(
                                  'assets/splash.json',
                                  height: 450,
                                  width: 450,

                                ),

                               const  Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center, // Metinleri sola hizalar
                                    children: [
                                       Text(
                                         "Sana Uygun İşler Yükleniyor...",
                                         style: TextStyle(
                                           fontSize: 24,
                                           fontFamily: "MRBold",
                                           color: Color(0xFF5A6073),
                                         ),
                                       ),
                                       SizedBox(height: 10), // Metinler arasında boşluk
                                      Center(
                                        child: Text(
                                          "Yetkinliklerin, lokasyonun ve tercihlerin arasında sana en uygun iş ilanlarını hazırlıyoruz.   Lütfen bekle!",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "MR",
                                            color: Color(0xFF5A6073),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),

        ));
  }
}

