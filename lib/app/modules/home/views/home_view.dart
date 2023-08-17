import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:marlo/app/common/models.dart';
import 'package:marlo/app/common/utils.dart';
import 'package:marlo/app/modules/home/views/filter_ui.dart';
import 'package:marlo/app/modules/home/views/transactions_card_list.dart';
import 'package:marlo/app/modules/home/views/transactions_table.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _controller = Get.put(HomeController());
  final TransactionsResponseModel? transData;

  HomeView({super.key, this.transData});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // _controller.getTransactions();
    return
//THIS IS THE MAIN AREA FOR DISPLAY
        Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
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
                        child:
                            SvgPicture.asset('aseests/svgs/transactions.svg'),
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
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                            child: textWidget(
                                text: 'MARLO', color: buttonTxtColor)),
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.5),
                              side: const BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xffF46715),
                        elevation: 2,
                        shape: const RoundedRectangleBorder(),
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
            TransactionsCardList(controller: _controller),
            const SizedBox(height: 15),
            textWidget(
                text: 'Transactions',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontsize: 20),
            const SizedBox(height: 15),
            SizedBox(
              child: Row(
                //FILTERS ROW
                children: [
                  textWidget(
                      text: 'Quick filters :  ',
                      color: Colors.black,
                      fontsize: 20),
                  const FilterButton(buttonName: "All"),
                  const FilterButton(buttonName: "Credit"),
                  const FilterButton(buttonName: "Debit"),
                  FilterDropDownButton(
                      buttonName: 'Currencies',
                      items: _controller.currencies,
                      selectedItems: _controller.selectedCurrencies),
                  const FilterDropDownButton(
                      buttonName: 'Statuses', items: [], selectedItems: []),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 36,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        foregroundColor: buttonTxtColor,
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: buttonTxtColor,
                        ),
                      ),
                      onPressed: () async {
                        await showCalendarDatePicker2Dialog(
                            context: context,
                            config: CalendarDatePicker2WithActionButtonsConfig(
                                calendarType: CalendarDatePicker2Type.range),
                            dialogSize: const Size(400, 500));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Time range',
                            style: TextStyle(fontSize: 12.5),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: buttonTxtColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SelectedFilterList(),
            const SizedBox(height: 20),
            TransactionsTable(
              width: width,
              allTransactions: transData?.response?.data,
            )
          ],
        ),
      ),
    );
  }
}
