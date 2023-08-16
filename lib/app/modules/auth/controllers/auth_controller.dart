import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:marlo/app/common/db.dart';

class AuthController extends GetxController {
  String? authToken;
  final String authUrl =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyBFiEDfEaaK6lBtIdxLXspmxGux1TGsCmg';
  authenticate({required BuildContext context}) async {
    Dio dio = Dio();
    try {
      dynamic response = await dio.post(authUrl, data: {
        "email": "geethumahi38+2@gmail.com",
        "password": "Marlo@123",
        "returnSecureToken": true
      });
      var data = json.decode(response.toString());
      authToken = data['idToken'];
      log(data.toString());
      log(authToken.toString());
      await SharedpreferenceHelper().saveToken(authToken!);
      GoRouter.of(context).pushReplacement('/main');
    } catch (e) {
      log("Something went wrong with authentication.");
    }
  }

  checkForToken({required BuildContext context}) async {
    log('CHECKING FOR AUTHENTICATION TOKEN');
    String? token = await SharedpreferenceHelper().getToken();

    if (token == null) {
      await authenticate(context: context);
    } else {
      log("ELSE CASE WORKED");
      GoRouter.of(context).pushReplacement('/main');
    }
  }
}
