import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marlo/app/common/models.dart';
import 'package:marlo/app/common/utils.dart';
import 'package:marlo/app/modules/home/controllers/home_controller.dart';

class TransactionsTable extends GetView<HomeController> {
  List<Transaction>? allTransactions;
  TransactionsTable({super.key, required this.width, this.allTransactions});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 243, 243),
          border: Border.all(width: 0.25, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 204, 204, 204),
                borderRadius: BorderRadius.all(Radius.circular(7))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: textWidget(
                      text: "TRANSACTIONS",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontsize: 15),
                ),
                const SizedBox(width: 10),
                textWidget(
                    text: "AMOUNT",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontsize: 15),
                const SizedBox(width: 10),
                textWidget(
                    text: "STATUS",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontsize: 15),
                const SizedBox(width: 10),
                textWidget(
                    text: "SOURCE",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontsize: 15),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: textWidget(
                      text: "CREATED BY",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontsize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              itemCount: 7,
              separatorBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: SvgPicture.asset(
                                'aseests/svgs/debit_arrow.svg',
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: width * 0.117,
                            child: textWidget(
                                text: allTransactions != null &&
                                        allTransactions!.isNotEmpty
                                    ? allTransactions![index]
                                        .description
                                        .toString()
                                    : 'Shipped to Abc pvt ltd',
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(),
                    SizedBox(
                        width: 85,
                        child: textWidget(
                            text: allTransactions != null &&
                                    allTransactions!.isNotEmpty
                                ? allTransactions![index].amount.toString()
                                : '10000000',
                            color: Colors.black)),
                    const SizedBox(width: 0),
                    Container(
                      width: 80,
                      height: 25,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 141, 190, 255),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: textWidget(
                            text: allTransactions != null &&
                                    allTransactions!.isNotEmpty
                                ? allTransactions![index].status.toString()
                                : 'Processing',
                            color: Colors.black,
                            fontsize: 12),
                      ),
                    ),
                    const SizedBox(width: 10),
                    textWidget(
                        text: allTransactions != null &&
                                allTransactions!.isNotEmpty
                            ? allTransactions![index].sourceType.toString()
                            : 'Payout',
                        color: Colors.black),
                    const SizedBox(),
                    textWidget(
                        text: allTransactions != null &&
                                allTransactions!.isNotEmpty
                            ? allTransactions![index].createdAt!.replaceRange(
                                19,
                                allTransactions![index].createdAt!.length,
                                '')
                            : 'Tuesday, 16 may, 10:46',
                        color: Colors.black),
                  ],
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20);
              },
            ),
          )
        ],
      ),
    );
  }
}
