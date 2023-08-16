import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marlo/app/common/db.dart';
import 'package:marlo/app/common/utils.dart';
import 'package:marlo/app/routes/routes.dart';

void main() {
  Timer.periodic(const Duration(hours: 1), (Timer timer) {
    SharedpreferenceHelper().clearToken();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Marlo Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: buttonTxtColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}
