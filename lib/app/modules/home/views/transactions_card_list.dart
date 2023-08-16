import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marlo/app/common/utils.dart';
import 'package:marlo/app/modules/home/controllers/home_controller.dart';

class TransactionsCardList extends GetView<HomeController> {
  const TransactionsCardList({
    super.key,
    required HomeController controller,
  }) : _controller = controller;

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                                      icon: const Icon(Icons.add, size: 40))
                                  : null,
                            ),
                            const SizedBox(width: 40),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, right: 10),
                              child: textWidget(
                                  text: index == _controller.cardData.length
                                      ? ""
                                      : _controller.cardData[index].currency,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        textWidget(
                            text: index == _controller.cardData.length
                                ? "Add new"
                                : _controller.cardData[index].amount.toString(),
                            fontWeight: FontWeight.bold,
                            fontsize: 20,
                            color: Colors.black),
                        const SizedBox(height: 7),
                        textWidget(
                            text: index == _controller.cardData.length
                                ? "Global account"
                                : _controller.cardData[index].TranscationType,
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
    );
  }
}
