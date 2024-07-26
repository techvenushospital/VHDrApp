import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_common_widgets/common_import.dart';
import '../../controllers/otscheduler_controller.dart';

class OperationListView extends StatelessWidget {
  const OperationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtschedulerController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
            color: ConstColor.whiteColor,
            border: Border.all(width: 0.5, color: ConstColor.boldBlackColor),
            borderRadius: BorderRadius.circular(10)),
        height: getDynamicHeight(size: 0.395),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getDynamicHeight(size: 0.015),
                vertical: getDynamicHeight(size: 0.020)),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.operationNameListData.length,
                itemBuilder: (item, index) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      controller.operationNameController.text = controller
                              .operationNameListData[index].operationName ??
                          '';
                      controller.selectedOperation =
                          controller.operationNameListData[index].id.toString();
                      controller.operationNamePopupController.hideMenu();
                      controller.update();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppText(
                                  text: controller.operationNameListData[index]
                                          .operationName ??
                                      ''),
                            ),
                          ],
                        ),
                        index == controller.operationNameListData.length - 1
                            ? const SizedBox()
                            : const SizedBox(
                                height: 15,
                              ),
                        index == controller.operationNameListData.length - 1
                            ? const SizedBox()
                            : const Divider(
                                thickness: 1,
                                height: 1,
                                color: ConstColor.greyACACAC,
                              )
                      ],
                    ),
                  );
                })),
      );
    });
  }
}