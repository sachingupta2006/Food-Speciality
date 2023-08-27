import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/Rewards/challenges.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math' as math;

class SpinTheWheel extends StatefulWidget {
  const SpinTheWheel({super.key});

  @override
  State<SpinTheWheel> createState() => _SpinTheWheelState();
}

class _SpinTheWheelState extends State<SpinTheWheel>
    with TickerProviderStateMixin {
  // List sectors = [0, 0, 0, 0, 0, 0];
  List sectors = [0, 10, 1, 0, 15, 25];
  int randomSectorIndex = -1;
  List sectorRadians = [];
  double angle = 0;
  int earnedValue = 0;
  bool spinning = false;
  math.Random random = math.Random();
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    generateSectorRadians();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3600));
    Tween<double> tween = Tween(begin: 0, end: 1);
    CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = tween.animate(curve);
    controller.addListener(() {
      if (controller.isCompleted) {
        setState(() {
          spinning = false;
          Timer(const Duration(seconds: 1), () {
            recordStats();
          });
        });

      }
    });
  } 

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(101.h),
          child: Column(
            children: [
              Container(
                height: 100.h,
                color: AppColors.grey54595F,
                // .withOpacity(0.84),
                child: Column(
                  children: [
                    // sizedBoxHeight(40.w),
                    Container(
                      color: AppColors.grey54595F,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Column(
                                    children: [
                                      sizedBoxHeight(20.h),
                                      Image.asset(
                                        "assets/icons/back_arrow.png",
                                        height: 15.h,
                                        width: 30.w,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                sizedBoxWidth(10.w),
                                Column(
                                  children: [
                                    sizedBoxHeight(20.h),
                                    Text(
                                      "Daily wheel spin",
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: "StudioProR",
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     sizedBoxHeight(5.h),
                            //     Text(
                            //       "Total Rewards Earned",
                            //       softWrap: true,
                            //       textAlign: TextAlign.center,
                            //       style: TextStyle(
                            //           fontSize: 12.sp,
                            //           fontFamily: "Roboto",
                            //           fontWeight: FontWeight.w400,
                            //           color: AppColors.white),
                            //     ),
                            //     sizedBoxHeight(9.h),
                            //     Container(
                            //       padding:
                            //           EdgeInsets.fromLTRB(20.w, 7.h, 20.w, 0),
                            //       decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(8.r)),
                            //       child: Row(
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: [
                            //           Image.asset('assets/svg/Coin.png'),
                            //           Column(
                            //             children: [
                            //               Obx(
                            //                 () => Text(
                            //                   totalCoins.string,
                            //                   style: TextStyle(
                            //                       fontSize: 17.sp,
                            //                       fontWeight: FontWeight.w600),
                            //                 ),
                            //               ),
                            //               sizedBoxHeight(5.h)
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     sizedBoxHeight(15.h)
                            //   ],
                            // ),
                         
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Container(
              //   color: AppColors.grey54595F,
              //   width: double.infinity,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16.w),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             InkWell(
              //               onTap: () {
              //                 Get.back();
              //               },
              //               child: Column(
              //                 children: [
              //                   sizedBoxHeight(15.h),
              //                   Image.asset(
              //                     "assets/icons/back_arrow.png",
              //                     height: 15.h,
              //                     width: 30.w,
              //                     color: AppColors.white,
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             sizedBoxWidth(10.w),
              //             Column(
              //               children: [
              //                 sizedBoxHeight(10.h),
              //                 Text(
              //                   "Daily wheel spin",
              //                   softWrap: true,
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                       fontSize: 18.sp,
              //                       fontFamily: "StudioProR",
              //                       fontWeight: FontWeight.w400,
              //                       color: AppColors.white),
              //                 ),
              //                 sizedBoxHeight(60.h),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
    
              sizedBoxHeight(50.h),
              SizedBox(
                // height: 350.h,
                child: Stack(
                  children: [
                    CircularPercentIndicator(
                      backgroundWidth: 32.w,
                      backgroundColor: const Color(0xffBFBAB4),
                      radius: 160.w,
                      center: AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: controller.value * angle,
                              child: FortuneWheel(
                                animateFirst: false,
                                physics: NoPanPhysics(),
                                indicators: const [
                                  FortuneIndicator(
                                      alignment: Alignment.topCenter,
                                      child: SizedBox()
                                      //  SvgPicture.asset(
                                      //   'assets/svg/Vector.svg',
                                      // ),
                                      )
                                ],
                                items: [
                                  FortuneItem(
                                      child: textBlack16w400('Try again'),
                                      style: FortuneItemStyle(
                                          borderWidth: 4.w,
                                          borderColor: Colors.white,
                                          color: const Color(0xffE3E0DA))),
                                  FortuneItem(
                                      child: textBlack16w400('10 coins'),
                                      style: FortuneItemStyle(
                                          borderWidth: 4.w,
                                          borderColor: Colors.white,
                                          color: const Color(0xffEFEFEF))),
                                  FortuneItem(
                                      child: textBlack16w400('1 coin'),
                                      style: FortuneItemStyle(
                                          borderWidth: 4.w,
                                          borderColor: Colors.white,
                                          color: const Color(0xffE3E4E0))),
                                  FortuneItem(
                                      child: textBlack16w400('Unlucky'),
                                      style: FortuneItemStyle(
                                          borderWidth: 4.w,
                                          borderColor: Colors.white,
                                          color: const Color(0xffE0DAD2))),
                                  FortuneItem(
                                      child: textBlack16w400('15 coins'),
                                      style: FortuneItemStyle(
                                          borderWidth: 4.w,
                                          borderColor: Colors.white,
                                          color: const Color(0xffEEEBE2))),
                                  FortuneItem(
                                      child: textBlack16w400('25 coins'),
                                      style: FortuneItemStyle(
                                          borderWidth: 4.w,
                                          borderColor: Colors.white,
                                          color: const Color(0xffE3E4E0))),
                                ],
                              ),
                            );
                          }),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: SvgPicture.asset('assets/svg/Vector.svg')),
                  ],
                ),
              ),
              sizedBoxHeight(80.h),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.grey54595F)),
                onPressed: () {
                  // Get.back();
                  // Get.to(() => const SpinTheWheel());
                  setState(() {
                    if (!spinning) {
                      spin();
                      spinning = true;
                    }
                  });
                },
                child: Text(
                  'Spin the Wheel',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              sizedBoxHeight(25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: Text(
                  'Spin, Win & Collect Coins! Collect Coins With A Single Spin Daily“',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.grey54595F,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void recordStats() {
    earnedValue = sectors[sectors.length - (randomSectorIndex + 1)];
    // totalCoins = totalCoins + earnedValue;
    earnedValue == 0
        ? Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            'Try again',
            'Better luck next time')
        : showDialog(
            context: context, builder: (context) => PPopupNew(coins: earnedValue));
  }

  void generateSectorRadians() {
    double sectorRadian = 2 * math.pi / 6;
    for (var i = 0; i < 6; i++) {
      sectorRadians.add((i + 1) * sectorRadian);
    }
  }

  void spin() {
    randomSectorIndex = random.nextInt(6);
    double randomRadian = generateRandomRadianToSpinTo();
    controller.reset();
    angle = randomRadian;
    controller.forward();
  }

  double generateRandomRadianToSpinTo() {
    return (2 * math.pi * 6) + sectorRadians[randomSectorIndex];
  }
}
