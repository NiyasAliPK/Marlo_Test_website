import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:marlo/app/common/db.dart';
import 'package:marlo/app/common/models.dart';
import 'package:marlo/app/common/utils.dart';

class TransactionsController extends GetxController {
  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }

  TransactionsResponseModel? responseData;
  final String _transactionUrl =
      'https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/v2/airwallex/995b1e2e-c5ac-417b-afe5-1de5e92f4cf3/transfers';
  getTransactions() async {
    try {
      String? token = await SharedpreferenceHelper().getToken();
      Dio dio = Dio();
      dio.options.headers['authtoken'] = token;
      dynamic response = await dio.get(_transactionUrl);
      var datas = json.decode(response.toString());

      var data = TransactionsResponseModel.fromJson(datas);
      if (data.response?.data == null) {
        data = TransactionsResponseModel();
        data =
            TransactionsResponseModel.fromJson(staticJsonDataForTransactions);
      }

      responseData = data;
      update();
    } catch (e) {
      log('Something went wrong failed getting transaction data >>>>>> $e');
    }
  }
}
