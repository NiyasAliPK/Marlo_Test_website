import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:marlo/app/common/utils.dart';
import 'package:marlo/app/modules/home/controllers/home_controller.dart';
import 'package:multiselect/multiselect.dart';

class FilterDropDownButton extends GetView<HomeController> {
  final String buttonName;
  final List<String> items;
  final List<String> selectedItems;

  const FilterDropDownButton({
    required this.items,
    required this.selectedItems,
    super.key,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 36,
        width: 120,
        child: DropDownMultiSelect(
          icon: Icon(
            Icons.arrow_drop_down,
            color: buttonTxtColor,
          ),
          hint: textWidget(
              text: buttonName, color: buttonTxtColor, fontsize: 12.5),
          options: items,
          selectedValues: selectedItems,
          selected_values_style: const TextStyle(color: Colors.transparent),
          onChanged: (p0) {
            controller.addFromMultiSelect(value: p0);
          },
        ),
      ),
    );
  }
}

class FilterButton extends GetView<HomeController> {
  final String buttonName;
  const FilterButton({
    super.key,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GetBuilder<HomeController>(builder: (_) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: buttonTxtColor),
            backgroundColor:
                controller.selectedFilters.isEmpty && buttonName == 'All'
                    ? const Color.fromARGB(255, 184, 212, 255)
                    : buttonName != 'All' &&
                            controller.selectedFilters.contains(buttonName)
                        ? const Color.fromARGB(255, 184, 212, 255)
                        : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          onPressed: () {
            if (buttonName != 'All') controller.addToList(value: buttonName);
          },
          child: SizedBox(
            height: 36,
            child: Center(
              child: Row(
                children: [
                  _getIcon(buttonName: buttonName),
                  const SizedBox(width: 10),
                  textWidget(
                    text: buttonName,
                    color: buttonTxtColor,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _getIcon({required String buttonName}) {
    if (buttonName == 'All' && controller.selectedFilters.isEmpty) {
      return SvgPicture.asset('aseests/svgs/check_circle_black.svg');
    } else if (buttonName == 'Credit') {
      return SvgPicture.asset('aseests/svgs/credit_arrow.svg');
    } else if (buttonName == 'Debit') {
      return SvgPicture.asset('aseests/svgs/debit_arrow.svg');
    } else {
      return const SizedBox();
    }
  }
}

class SelectedFilterList extends GetView<HomeController> {
  const SelectedFilterList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 30,
            child: GetBuilder<HomeController>(builder: (_) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.selectedFilters.isNotEmpty
                    ? controller.selectedFilters.length + 1
                    : controller.selectedFilters.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (BuildContext context, int index) {
                  return controller.selectedFilters.isNotEmpty &&
                          index == controller.selectedFilters.length
                      ? TextButton(
                          onPressed: () {
                            controller.clearFilters();
                          },
                          child: textWidget(
                              text: 'Clear all',
                              fontWeight: FontWeight.bold,
                              color: buttonTxtColor))
                      : Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: buttonTxtColor, width: 0.5)),
                          // width: 50,
                          child: Center(
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                textWidget(
                                    text: controller.selectedFilters[index],
                                    color: buttonTxtColor),
                                IconButton(
                                    onPressed: () {
                                      controller.removeFromFilter(
                                          value: controller
                                              .selectedFilters[index]);
                                    },
                                    icon: SvgPicture.asset(
                                      'aseests/svgs/close_button.svg',
                                      color: buttonTxtColor,
                                    ))
                              ],
                            ),
                          ),
                        );
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
