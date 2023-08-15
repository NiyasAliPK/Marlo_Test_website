import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:get/get.dart';

class FrameController extends GetxController {
  SideMenuController sideMenu = SideMenuController();
  SideMenuDisplayMode sidemenuMode = SideMenuDisplayMode.compact;

  changeDisplayMode({required bool isHover}) async {
    if (isHover) {
      sidemenuMode = SideMenuDisplayMode.open;
    } else {
      sidemenuMode = SideMenuDisplayMode.compact;
    }
    update();
  }
}
