import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo/app/common/models.dart';

class HomeController extends GetxController {
  final String authUrl =
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyBFiEDfEaaK6lBtIdxLXspmxGux1TGsCmg';

  String? authToken;
  int selectedIndex = 0;
  List<Color> colors = [
    const Color.fromARGB(255, 255, 153, 221),
    const Color.fromARGB(255, 153, 218, 255),
    const Color.fromARGB(255, 153, 248, 255),
    const Color.fromARGB(237, 153, 255, 207),
    const Color.fromARGB(255, 185, 255, 153),
    const Color.fromARGB(255, 255, 231, 153),
    const Color.fromARGB(255, 218, 218, 218),
  ];

  List<TransactionCardDataModel> cardData = [
    TransactionCardDataModel(
        amount: 15626423, currency: 'GBP', TranscationType: 'Main'),
    TransactionCardDataModel(
        amount: 2345642, currency: 'USD', TranscationType: 'Salary'),
    TransactionCardDataModel(
        amount: 784765, currency: 'EUR', TranscationType: 'Shipping'),
    TransactionCardDataModel(
        amount: 1324652, currency: 'SGD', TranscationType: 'Salary'),
    TransactionCardDataModel(
        amount: 3654786, currency: 'EUR', TranscationType: 'Shipping'),
    TransactionCardDataModel(
        amount: 5642345, currency: 'SGD', TranscationType: 'Salary'),
  ];

  changeSelectedIndex({required int index}) {
    selectedIndex = index;
    update();
  }

  authenticate() async {
    Dio dio = Dio();
    try {
      dynamic response = await dio.post(authUrl, data: {
        "email": "geethumahi38+2@gmail.com",
        "password": "Marlo@123",
        "returnSecureToken": true
      });
      var resp = json.decode(response.toString());
      authToken = resp['idToken'];
    } catch (e) {
      log("Something went wrong with authentication.");
    }
  }
}
