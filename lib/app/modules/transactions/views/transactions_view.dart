import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marlo/app/modules/home/views/home_view.dart';

import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  const TransactionsView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TransactionsController());

    return GetBuilder<TransactionsController>(
      builder: (controller) {
        return (controller.responseData == null)
            ? const Expanded(child: Center(child: CircularProgressIndicator()))
            : HomeView(transData: controller.responseData);
      },
    );
  }
}
