import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo/app/common/models.dart';

class HomeController extends GetxController {
  List<Color> colors = [
    const Color.fromARGB(255, 255, 153, 221),
    const Color.fromARGB(255, 153, 218, 255),
    const Color.fromARGB(255, 153, 248, 255),
    const Color.fromARGB(237, 153, 255, 207),
    const Color.fromARGB(255, 185, 255, 153),
    const Color.fromARGB(255, 255, 231, 153),
    const Color.fromARGB(255, 218, 218, 218),
  ];

  List<String> currencies = ['USD', 'EUR', 'SGD', 'CAD', 'AUD'];
  List<String> selectedCurrencies = [];
  List<String> selectedFilters = [];

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

  addToList({required String value}) {
    if (selectedFilters.contains(value)) {
      selectedFilters.remove(value);
    } else {
      selectedFilters.add(value);
    }
    update();
  }

  addFromMultiSelect({required List<String> value}) {
    for (String item in value) {
      if (!selectedFilters.contains(item)) {
        selectedFilters.add(item);
      }
      update();
    }
  }

  removeFromFilter({required String value}) {
    selectedFilters.remove(value);
    if (selectedCurrencies.contains(value)) {
      selectedCurrencies.remove(value);
    }
    update();
  }

  clearFilters() {
    selectedFilters.clear();

    selectedCurrencies.clear();
    update();
  }
}
