// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:venus/app/modules/labReports/views/widgets/ref.dart';
import 'package:venus/main.dart';

import '../../../app_common_widgets/common_import.dart';
import '../controllers/lab_reports_controller.dart';
import 'widgets/start_heading.dart';

class LabReportsViewCopy extends GetView<LabReportsController> {
  String patientName;
  String bedNumber;
  LabReportsViewCopy(
      {super.key, required this.patientName, required this.bedNumber});
  @override
  Widget build(BuildContext context) {
    Get.put(LabReportsController());
    return GetBuilder<LabReportsController>(
      builder: (controller) {
        return Scaffold(
          // appBar: AppBar(
          //   title: AppText(
          //     text: 'Lab Reports',
          //     fontSize: Sizes.px22,
          //     fontColor: ConstColor.headingTexColor,
          //     fontWeight: FontWeight.w800,
          //   ),
          //   centerTitle: true,
          //   backgroundColor: Colors.white,
          //   elevation: 2,
          //   excludeHeaderSemantics: false,
          //   surfaceTintColor: Colors.white,
          //   shadowColor: Colors.grey,
          //   leading: IconButton(
          //       icon: const Icon(Icons.arrow_back),
          //       onPressed: () => Navigator.pop(context)),
          // ),
          backgroundColor: Colors.white,
          // drawer: const MyDrawer(),
          body: GestureDetector(
            onPanUpdate: (s) {
              hideBottomBar.value = false;
              controller.showSwipe = false;
              controller.update();
            },
            onTap: () {
              hideBottomBar.value = false;
              controller.showSwipe = false;
              controller.update();
            },
            child: controller.commonList.isEmpty
                ? Column(children: [
                    AppBar(
                      title: AppText(
                        text: 'Lab Reports',
                        fontSize: Sizes.px22,
                        fontColor: ConstColor.headingTexColor,
                        fontWeight: FontWeight.w800,
                      ),
                      centerTitle: true,
                      backgroundColor: Colors.white,
                      elevation: 2,
                      excludeHeaderSemantics: false,
                      surfaceTintColor: Colors.white,
                      shadowColor: Colors.grey,
                      leading: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context)),
                    ),
                    Expanded(
                      child: Center(
                        child: AppText(
                          text: 'No data found',
                          fontSize: Sizes.px15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ])
                : Stack(
                    children: [
                      Column(
                        children: [
                          AppBar(
                            title: AppText(
                              text: 'Lab Reports',
                              fontSize: Sizes.px22,
                              fontColor: ConstColor.headingTexColor,
                              fontWeight: FontWeight.w800,
                            ),
                            centerTitle: true,
                            backgroundColor: Colors.white,
                            elevation: 2,
                            excludeHeaderSemantics: false,
                            surfaceTintColor: Colors.white,
                            shadowColor: Colors.grey,
                            leading: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () => Navigator.pop(context)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Sizes.crossLength * 0.020,
                                right: Sizes.crossLength * 0.020,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Sizes.crossLength * 0.025,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 1,
                                        color: ConstColor.black6B6B6B
                                            .withOpacity(0.20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            getDynamicHeight(size: 0.012),
                                        vertical: getDynamicHeight(size: 0.015),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: AppText(
                                              text: patientName,
                                              fontSize: Sizes.px14,
                                              fontColor: ConstColor.buttonColor,
                                              fontWeight: FontWeight.w600,
                                              maxLine: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Sizes.crossLength * 0.015,
                                          ),
                                          bedNumber != ''
                                              ? AppText(
                                                  text: 'Bed: $bedNumber',
                                                  fontSize: Sizes.px14,
                                                  fontColor:
                                                      ConstColor.black6B6B6B,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Sizes.crossLength * 0.015,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: controller.commonList.length,
                                      controller:
                                          controller.allscrollController,
                                      shrinkWrap: true,
                                      itemBuilder: (item, index) {
                                        List indexWiseData = controller
                                            .commonList[index]['data'];
                                        List dateLists = controller.getKey(
                                            controller.commonList[index]
                                                ['data']);
                                        List dateLists1 = controller.getKey1(
                                            controller.commonList[index]
                                                ['data']);
                                        return Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      if (controller.dataContain
                                                          .contains(controller
                                                                      .commonList[
                                                                  index][
                                                              'report_name'])) {
                                                        controller.dataContain
                                                            .remove(controller
                                                                        .commonList[
                                                                    index][
                                                                'report_name']);
                                                      } else {
                                                        controller.dataContain =
                                                            [];
                                                        controller.dataContain
                                                            .add(controller
                                                                        .commonList[
                                                                    index][
                                                                'report_name']);
                                                      }
                                                      controller.update();
                                                      if (controller.dataContain
                                                          .isNotEmpty) {
                                                        hideBottomBar.value =
                                                            true;
                                                      } else {
                                                        hideBottomBar.value =
                                                            false;
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          width: 1,
                                                          color: ConstColor
                                                              .black6B6B6B
                                                              .withOpacity(
                                                                  0.20),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          vertical:
                                                              getDynamicHeight(
                                                                  size: 0.010),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal:
                                                                    getDynamicHeight(
                                                                        size:
                                                                            0.010),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        AppText(
                                                                      text: controller.commonList[index]
                                                                              [
                                                                              'report_name'] ??
                                                                          "",
                                                                      fontSize:
                                                                          Sizes
                                                                              .px14,
                                                                      fontColor:
                                                                          ConstColor
                                                                              .buttonColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      maxLine:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    controller
                                                                            .dataContain
                                                                            .contains(controller.commonList[index][
                                                                                'report_name'])
                                                                        ? Icons
                                                                            .keyboard_arrow_up
                                                                        : Icons
                                                                            .keyboard_arrow_down,
                                                                    size: 40,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            controller.dataContain
                                                                    .contains(controller
                                                                            .commonList[index]
                                                                        [
                                                                        'report_name'])
                                                                ? const SizedBox(
                                                                    height: 10,
                                                                  )
                                                                : const SizedBox(),
                                                            controller.dataContain
                                                                    .contains(controller
                                                                            .commonList[index]
                                                                        [
                                                                        'report_name'])
                                                                ? Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: ConstColor
                                                                          .whiteColor,
                                                                      border:
                                                                          Border(
                                                                        bottom:
                                                                            BorderSide(
                                                                          width:
                                                                              1,
                                                                          color: ConstColor
                                                                              .blackColor
                                                                              .withOpacity(0.3),
                                                                        ),
                                                                        left:
                                                                            BorderSide(
                                                                          width:
                                                                              1,
                                                                          color: ConstColor
                                                                              .blackColor
                                                                              .withOpacity(0.3),
                                                                        ),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    clipBehavior:
                                                                        Clip.hardEdge,
                                                                    child:
                                                                        IntrinsicHeight(
                                                                      child:
                                                                          Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.stretch,
                                                                        children: [
                                                                          // VerticalDivider(
                                                                          //   thickness:
                                                                          //       1,
                                                                          //   color:
                                                                          //       ConstColor.blackColor.withOpacity(0.3),
                                                                          //   width:
                                                                          //       1,
                                                                          // ),
                                                                          Expanded(
                                                                              flex: 4,
                                                                              child: StartingHeading(
                                                                                allReportsData: indexWiseData,
                                                                                height: getHeight(indexWiseData),
                                                                              )),
                                                                          VerticalDivider(
                                                                            thickness:
                                                                                1,
                                                                            color:
                                                                                ConstColor.blackColor.withOpacity(0.3),
                                                                            width:
                                                                                1,
                                                                          ),
                                                                          SizedBox(
                                                                              width: getDynamicHeight(size: 0.075),
                                                                              child: ReferenceWidget(allReportsData: indexWiseData, height: getHeight(indexWiseData))),
                                                                          VerticalDivider(
                                                                            thickness:
                                                                                1,
                                                                            color:
                                                                                ConstColor.blackColor.withOpacity(0.3),
                                                                            width:
                                                                                1,
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                7,
                                                                            child:
                                                                                SizedBox(
                                                                              height: getHeight(indexWiseData),
                                                                              child: ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                scrollDirection: Axis.horizontal,
                                                                                shrinkWrap: true,
                                                                                itemCount: dateLists.length,
                                                                                itemBuilder: (context, index) {
                                                                                  return IntrinsicHeight(
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              decoration: const BoxDecoration(
                                                                                                color: ConstColor.buttonColor,
                                                                                              ),
                                                                                              height: 50,
                                                                                              width: getDynamicHeight(size: 0.070),
                                                                                              child: Center(
                                                                                                child: AppText(
                                                                                                  text: "${dateLists[index]}",
                                                                                                  fontSize: Sizes.px13,
                                                                                                  fontColor: ConstColor.whiteColor,
                                                                                                  fontWeight: FontWeight.w700,
                                                                                                  textAlign: TextAlign.center,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            const SizedBox(
                                                                                              height: 5,
                                                                                            ),
                                                                                            IntrinsicHeight(
                                                                                              child: SizedBox(
                                                                                                height: getHeight(indexWiseData),
                                                                                                width: getDynamicHeight(size: 0.070),
                                                                                                child: ListView.builder(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  shrinkWrap: true,
                                                                                                  itemCount: indexWiseData.length,
                                                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                                                  // controller: controller.scrollController3[index],
                                                                                                  itemBuilder: (item, i) {
                                                                                                    return IntrinsicHeight(
                                                                                                      child: Column(
                                                                                                        children: [
                                                                                                          SizedBox(
                                                                                                            height: getDynamicHeight(size: 0.055),
                                                                                                            child: Center(
                                                                                                                child: Column(
                                                                                                              children: [
                                                                                                                AppText(
                                                                                                                  text: indexWiseData[i][dateLists1[index]] != null && indexWiseData[i][dateLists1[index]] != '' ? indexWiseData[i][dateLists1[index]] : '-',
                                                                                                                  fontSize: Sizes.px13,
                                                                                                                  fontColor: ConstColor.black6B6B6B,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  maxLine: 2,
                                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                                ),
                                                                                                                AppText(
                                                                                                                  text: indexWiseData[i]['Unit'] ?? '-',
                                                                                                                  fontSize: Sizes.px9,
                                                                                                                  fontColor: ConstColor.black6B6B6B,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                ),
                                                                                                              ],
                                                                                                            )
                                                                                                                // : const SizedBox(),
                                                                                                                ),
                                                                                                          ),
                                                                                                          Divider(
                                                                                                            thickness: 1,
                                                                                                            height: getDynamicHeight(size: 0.002),
                                                                                                            color: ConstColor.blackColor.withOpacity(0.3),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                        VerticalDivider(
                                                                                          thickness: 1,
                                                                                          color: ConstColor.blackColor.withOpacity(0.3),
                                                                                          width: 1,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                : const SizedBox()
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      controller.showSwipe
                          ? Container(
                              height: Get.height,
                              width: Get.width,
                              color: Colors.black.withOpacity(0.5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/svg/swipe.svg'),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Center(
                                    child: AppText(
                                      text:
                                          'Swipe right for more reports (if available)',
                                      fontSize: Sizes.px15,
                                      fontColor: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
          ),
        );
      },
    );
  }
}

getHeight(List alldata) {
  // if (alldata.length > 2) {
  //   return ((alldata.length) * (Sizes.crossLength * .0713));
  // } else {
  return ((alldata.length) * (Sizes.crossLength * .057));
  // }
}