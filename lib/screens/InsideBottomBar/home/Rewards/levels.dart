import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

import 'challenges.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.h),
        child: Column(
          children: [
            // Container(
            //   color: AppColors.grey54595F,
            //   width: double.infinity,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 16.w),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             InkWell(
            //               onTap: () {
            //                 Get.back();
            //               },
            //               child: Column(
            //                 children: [
            //                   sizedBoxHeight(20.h),
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
            //                 sizedBoxHeight(20.h),
            //                 Text(
            //                   "Levels",
            //                   softWrap: true,
            //                   textAlign: TextAlign.center,
            //                   style: TextStyle(
            //                       fontSize: 18.sp,
            //                       fontFamily: "StudioProR",
            //                       fontWeight: FontWeight.w400,
            //                       color: AppColors.white),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             sizedBoxHeight(5.h),
            //             Text(
            //               "Total Rewards Earned",
            //               softWrap: true,
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                   fontSize: 12.sp,
            //                   fontFamily: "Roboto",
            //                   fontWeight: FontWeight.w400,
            //                   color: AppColors.white),
            //             ),
            //             sizedBoxHeight(9.h),
            //             Container(
            //               padding:
            //                   EdgeInsets.fromLTRB(20.w, 7.h, 20.w, 0),
            //               decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.circular(8.r)),
            //               child: Row(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   Image.asset('assets/svg/Coin.png'),
            //                   Column(
            //                     children: [
            //                       Obx(
            //                           () => Text(
            //                             totalCoins.string,
            //                             style: TextStyle(
            //                                 fontSize: 17.sp,
            //                                 fontWeight: FontWeight.w600),
            //                           ),
            //                         ),
            //                       sizedBoxHeight(5.h)
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             sizedBoxHeight(15.h)
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      body: Column(children: [
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
                          "Levels",
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sizedBoxHeight(5.h),
                    Text(
                      "Total Rewards Earned",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                          color: AppColors.white),
                    ),
                    sizedBoxHeight(9.h),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.w, 7.h, 20.w, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/svg/Coin.png'),
                          Column(
                            children: [
                              Obx(
                                () => Text(
                                  totalCoins.string,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              sizedBoxHeight(5.h)
                            ],
                          ),
                        ],
                      ),
                    ),
                    sizedBoxHeight(15.h)
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxHeight(10.h),
                      levelRow('Iron', 1, true),
                      verDivider(44, [
                        dotTxtRow('Profile Setup'),
                        dotTxtRow('Have upto 5 recipes'),
                      ]),
                      levelRow('Bronze', 2, true),
                      verDivider(66, [
                        dotTxtRow('Reach tier bronze'),
                        dotTxtRow('5 recipes'),
                        dotTxtRow('Have 100 Coins'),
                      ]),
                      levelRow('Silver', 3, false),
                      verDivider(68, [
                        dotTxtRow('Reach tier bronze'),
                        dotTxtRow('Have 10 recipes'),
                        dotTxtRow('Have 250 Coins'),
                      ]),
                      levelRow('Golden', 4, false),
                      verDivider(96, [
                        dotTxtRow('Reach tier silver'),
                        dotTxtRow('Have 25 recipes'),
                        dotTxtRow('Have atleast 1 community setup'),
                        dotTxtRow('Have 500 Coins'),
                      ]),
                      levelRow('Diamond', 5, false),
                      verDivider(64, [
                        dotTxtRow('Reach tier gold'),
                        dotTxtRow('Have 50 recipes'),
                        dotTxtRow('Have 750 Coins'),
                      ]),
                      levelRow('Platinum', 6, false),
                      verDivider(61, [
                        dotTxtRow('Reach tier diamond'),
                        dotTxtRow('Have 100 recipes'),
                        dotTxtRow('Have 1000 Coins'),
                      ]),
                      levelRow('Executive', 7, false),
                      verDivider(101, [
                        dotTxtRow('Reach tier platinum'),
                        dotTxtRow('Have more than 150 recipes'),
                        dotTxtRow(
                            'Unlock rewards exclusive to Exclusive Members'),
                        dotTxtRow(
                            'First to know about new products & insider content'),
                      ]),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Image.asset('assets/svg/levelEnding.png',
                    //   height: 116.h,
                    //   width: MediaQuery.of(context).size.width,
                    // ),
                    Container(
                      height: 116..h,
                      width: double.infinity,
                      // color: AppColors.black.withOpacity(0.41),
                      decoration: const BoxDecoration(

                          // color: AppColors.black.withOpacity(0.41),

                          image: DecorationImage(
                              image: AssetImage("assets/svg/levelEnding.png"),
                              fit: BoxFit.fill)),
                    ),

                    Container(
                      height: 116..h,
                      width: double.infinity,
                      // color: AppColors.black.withOpacity(0.41),
                      decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.41),

                        // image: DecorationImage(
                        //   image: AssetImage("assets/svg/levelEnding.png"),
                        //   fit: BoxFit.fill
                        // )
                      ),
                    ),

                    Center(
                      child: Text(
                        'You are one of the best players!!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                // Positioned(
                //     // bottom: 0,
                //     // left: 50,
                //     // right: 0,
                //     // top: 40,
                //     child: Center(
                //       child: Text(
                //         'You are one of the best players!!',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 20.sp,
                //             fontWeight: FontWeight.w700),
                //       ),
                //     )),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget verDivider(int height, List<Widget> listTxt) {
    return Row(
      children: [
        sizedBoxWidth(15.w),
        SizedBox(
            height: height.h,
            child: VerticalDivider(thickness: 1.5.w, color: Colors.black)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: listTxt),
      ],
    );
  }

  Widget dotTxtRow(String txt) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 5.h,
              width: 5.h,
              decoration: BoxDecoration(
                  color: AppColors.grey54595F,
                  borderRadius: BorderRadius.circular(100)),
            ),
            sizedBoxWidth(5.w),
            Text(
              txt,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Roboto',
                  color: AppColors.grey54595F),
            ),
          ],
        ),
        sizedBoxHeight(4.h)
      ],
    );
  }

  Widget levelRow(String name, int level, bool tick) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/svg/$name.png'),
            sizedBoxWidth(10.w),
            Column(
              children: [
                sizedBoxHeight(15.h),
                Text(
                  name,
                  style: TextStyle(
                      color: AppColors.grey54595F,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp),
                ),
              ],
            ),
            sizedBoxWidth(10.w),
            Column(
              children: [
                sizedBoxHeight(15.h),
                Text(
                  'Level $level',
                  style: TextStyle(
                      color: AppColors.grey54595F.withOpacity(0.3882),
                      fontFamily: 'Roboto',
                      fontSize: 14.sp),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            sizedBoxHeight(15.h),
            tick ? SvgPicture.asset('assets/svg/tick.svg') : const SizedBox(),
          ],
        )
      ],
    );
  }
}
