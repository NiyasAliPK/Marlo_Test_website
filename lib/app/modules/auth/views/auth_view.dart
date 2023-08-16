import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  final AuthController _controller = Get.put(AuthController());
  AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<dynamic>(
          future: _controller.checkForToken(context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (controller.authToken == null) {
              return const Text('Something went Wrong, Please try again.');
            } else {
              return const Text('AUTHENTICATED.');
            }
          },
        ),
      ),
    );
  }
}
