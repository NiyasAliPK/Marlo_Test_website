import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:marlo/app/common/utils.dart';
import 'package:marlo/app/modules/home/views/home_view.dart';

import '../controllers/frame_controller.dart';

class FrameView extends GetView<FrameController> {
  final FrameController _controller = Get.put(FrameController());

  FrameView({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: Size(width * 0.1, height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: height * 0.025, left: width * 0.02),
                    child: SizedBox(
                      child: SvgPicture.asset(
                        'aseests/svgs/marlo.svg',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.025, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(text: "MARLO TECHNOLOGIES"),
                        const Icon(Icons.arrow_drop_down_outlined,
                            color: Colors.white),
                        const SizedBox(width: 25),
                        SvgPicture.asset(
                          'aseests/svgs/notifications.svg',
                        ),
                        const SizedBox(width: 25),
                        SvgPicture.asset(
                          'aseests/svgs/account.svg',
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          backgroundColor: primaryColor,
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Center(child:
              //  FutureBuilder<dynamic>(
              //   future: _controller.authenticate(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const CircularProgressIndicator();
              //     } else if (controller.authToken == null) {
              //       return const Text('Something went Wrong, Please try again.');
              //     } else {
              //       return
              //       ;
              //     }
              //   },
              // ),
              GetBuilder<FrameController>(builder: (_) {
            return MouseRegion(
              onEnter: (event) {
                _controller.changeDisplayMode(isHover: true);
              },
              onExit: (event) {
                _controller.changeDisplayMode(isHover: false);
              },
              child: SideMenu(
                title: _controller.sidemenuMode == SideMenuDisplayMode.open
                    ? Container(
                        height: 100,
                        width: double.infinity,
                        color: const Color(0xff393F5C),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Row(
                                children: [
                                  textWidget(
                                      text: 'Submit your KYC', fontsize: 20),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_forward_ios,
                                      color: Colors.white)
                                ],
                              ),
                            ),
                            const LinearProgressIndicator(
                              color: Colors.blue,
                              value: 0.1,
                            )
                          ],
                        ))
                    : null,
                controller: _controller.sideMenu,
                style: SideMenuStyle(
                    selectedColor: const Color(0xff415094),
                    compactSideMenuWidth: width * 0.05,
                    displayMode: _controller.sidemenuMode,
                    backgroundColor: primaryColor,
                    selectedIconColor: Colors.white,
                    unselectedIconColor: Colors.white,
                    selectedTitleTextStyle:
                        const TextStyle(color: Colors.white),
                    unselectedTitleTextStyle:
                        const TextStyle(color: Colors.white),
                    itemInnerSpacing: width * 0.01),
                items: [
                  SideMenuItem(
                    title: 'Home',
                    onTap: (index, _) {
                      _controller.sideMenu.changePage(index);
                    },
                    iconWidget: SvgPicture.asset('aseests/svgs/home.svg'),
                  ),
                  // SideMenuItem(
                  //   title: 'Transactions',
                  //   onTap: (index, _) {
                  //     sideMenu.changePage(index);
                  //   },
                  //   iconWidget: SvgPicture.asset(
                  //       'aseests/svgs/transactions.svg'),
                  // ),
                  SideMenuItem(
                    title: 'Transactions',
                    onTap: (index, _) {
                      _controller.sideMenu.changePage(index);
                    },
                    icon: const Icon(Icons.wallet_travel_outlined),
                  ),
                ],
              ),
            );
          })),
          HomeView()
        ]));
  }
}
