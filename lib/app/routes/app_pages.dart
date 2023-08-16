import 'package:get/get.dart';

import 'package:marlo/app/modules/home/bindings/home_binding.dart';
import 'package:marlo/app/modules/home/views/home_view.dart';
import 'package:marlo/app/modules/transactions/bindings/transactions_binding.dart';
import 'package:marlo/app/modules/transactions/views/transactions_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.FRAME,
    //   // page: () => FrameView(),
    //   binding: FrameBinding(),
    // ),
    GetPage(
      name: _Paths.TRANSACTIONS,
      page: () => TransactionsView(),
      binding: TransactionsBinding(),
    ),
  ];
}
