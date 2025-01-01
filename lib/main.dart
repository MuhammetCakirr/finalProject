import 'package:finalprojectapp/Controllers/home_controller.dart';
import 'package:finalprojectapp/Controllers/sign_up_controller.dart';
import 'package:finalprojectapp/Views/Authentication/Signup/sign_up_first_page.dart';

import 'package:finalprojectapp/Views/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => SignUpController()),
      ],
      child:const  MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Engelsiz Kariyer Köprüsü',
      debugShowCheckedModeBanner: false,
      home:  Home(),
    );
  }
}

