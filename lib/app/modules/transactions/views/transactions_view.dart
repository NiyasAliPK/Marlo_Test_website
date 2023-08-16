import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransactionsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TransactionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
