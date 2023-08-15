import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:marlo/app/common/utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _controller = Get.put(HomeController());

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return
//THIS IS THE MAIN AREA FOR DISPLAY
        Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 37,
                      height: 37,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7))),
                      child: SvgPicture.asset('aseests/svgs/transactions.svg'),
                    ),
                    const SizedBox(width: 10),
                    textWidget(
                        text: 'Transactions  /  ',
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontsize: 25),
                    Container(
                      width: 76,
                      height: 37,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 184, 212, 255),
                          // border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Center(
                          child:
                              textWidget(text: 'MARLO', color: buttonTxtColor)),
                    ),
                    const SizedBox(width: 25),
                    textWidget(text: 'HDFC - 3825', color: Colors.black),
                    const SizedBox(width: 25),
                    SizedBox(
                      height: 37,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: textWidget(
                            text: 'Link account',
                            color: buttonTxtColor,
                            fontWeight: FontWeight.bold),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: buttonTxtColor,
                          // backgroundColor: Colors.white,
                          // elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.5),
                            side: const BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(width: width / 1.9),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xffF46715),
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                          // borderRadius:
                          // BorderRadius.circular(8),
                          ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.add),
                            const SizedBox(width: 8),
                            textWidget(text: 'PAYOUT', color: Colors.white),
                          ],
                        ),
                        const SizedBox(width: 10),
                        const VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          width: 1,
                          endIndent: 15,
                          indent: 15,
                        ),
                        const SizedBox(width: 15),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Divider(color: Colors.grey, thickness: 0.25),
          Container(
            padding: const EdgeInsets.only(left: 15),
            height: 170,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                      color: Colors.white,
                      child: SizedBox(
                        width: 160,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: _controller.colors[index],
                                    radius: 30,
                                    child: index == _controller.cardData.length
                                        ? IconButton(
                                            onPressed: () {},
                                            icon:
                                                const Icon(Icons.add, size: 40))
                                        : null,
                                  ),
                                  const SizedBox(width: 40),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, right: 10),
                                    child: textWidget(
                                        text:
                                            index == _controller.cardData.length
                                                ? ""
                                                : _controller
                                                    .cardData[index].currency,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              textWidget(
                                  text: index == _controller.cardData.length
                                      ? "Add new"
                                      : _controller.cardData[index].amount
                                          .toString(),
                                  fontWeight: FontWeight.bold,
                                  fontsize: 20,
                                  color: Colors.black),
                              const SizedBox(height: 7),
                              textWidget(
                                  text: index == _controller.cardData.length
                                      ? "Global account"
                                      : _controller
                                          .cardData[index].TranscationType,
                                  color: Colors.black)
                            ],
                          ),
                        ),
                      ));
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 20);
                },
                itemCount: _controller.cardData.length + 1),
          )
        ],
      ),
    );
  }
}
