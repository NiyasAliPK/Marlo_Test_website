import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo/app/modules/home/views/home_view.dart';
import 'package:marlo/app/modules/transactions/views/transactions_view.dart';

class FrameController extends GetxController {
  SideMenuController sideMenu = SideMenuController();
  SideMenuDisplayMode sidemenuMode = SideMenuDisplayMode.compact;
  int selectedIndex = 0;

  changeDisplayMode({required bool isHover}) async {
    if (isHover) {
      sidemenuMode = SideMenuDisplayMode.open;
    } else {
      sidemenuMode = SideMenuDisplayMode.compact;
    }
    update();
  }

  getContent() {
    if (sideMenu.currentPage == 0) {
      HomeView();
    } else if (sideMenu.currentPage == 1) {
      TransactionsView();
    } else {
      const SizedBox();
    }
    update();
  }

  changeSelectedIndex() {
    selectedIndex = sideMenu.currentPage;
    update();
  }
}
