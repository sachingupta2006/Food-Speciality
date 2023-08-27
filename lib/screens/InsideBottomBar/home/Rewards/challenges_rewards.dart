import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/Rewards/levels.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/Rewards/redeem.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/Rewards/spin_the_wheel.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/common/list_card.dart';
import 'package:foodspeciality/screens/bottom_bar.dart';
import 'package:foodspeciality/screens/recipe_ingredients.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

import 'challenges.dart';

class ChallengesAndRewards extends StatefulWidget {
  const ChallengesAndRewards({super.key});

  @override
  State<ChallengesAndRewards> createState() => _ChallengesAndRewardsState();
}

class _ChallengesAndRewardsState extends State<ChallengesAndRewards>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(color: AppColors.grey54595F
              // .withOpacity(0.84),
              )),
      body: Column(
        children: [
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
                            "Challenges and Rewards",
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
                      sizedBoxHeight(25.h)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    sizedBoxHeight(28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const SpinTheWheel());
                            },
                            child: catContainer(AppColors.white,
                                'Spin the wheel', 'SpinWheel')),
                        sizedBoxWidth(25),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const Challenges());
                          },
                          child: catContainer(
                              AppColors.white, 'Challenges', 'Challenges'),
                        ),
                      ],
                    ),
                    sizedBoxHeight(40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const Levels());
                            },
                            child: catContainer(
                                AppColors.white, 'Levels', 'VectorCat')),
                        sizedBoxWidth(25),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const Redeem());
                          },
                          child: redeemContainer(),
                        ),
                      ],
                    ),
                    sizedBoxHeight(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Key Challenges',
                          style: TextStyle(
                              color: AppColors.grey54595F,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => const PPopupDailyBonus());
                          },
                          child: Container(
                              height: 77.h,
                              width: 77.h,
                              decoration: BoxDecoration(
                                  color: AppColors.grey9A9A9A,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      // offset: Offset(0, 3),
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  gradient: const RadialGradient(
                                    colors: [
                                      Color.fromARGB(255, 196, 196, 196),
                                      AppColors.grey9A9A9A
                                      // Colors.blue, // Change the colors as per your preference
                                      // Colors.white,
                                    ],
                                    stops: [0.0, 1.0],
                                    center: Alignment.center,
                                    radius: 1.0,
                                    tileMode: TileMode.clamp,
                                  ),
                                  // borderRadius: BorderRadius.circular(40.h),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: Center(
                                  child: textWhite14Robo("DAILY BONUS"))),
                        ),
                      ],
                    ),
                    sizedBoxHeight(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        keyContainer('Upload a recipe', 'Upload', () {
                          Get.to(() => const RecipeIng());
                        }),
                        keyContainer('Create a community', 'CreateCommunity',
                            () {
                          Get.to(() => BottomBar(
                                selectedIndex: 3,
                              ));
                        }),
                      ],
                    ),
                    sizedBoxHeight(30.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.grey54595F,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/svg/inviteCoins.svg'),
                          sizedBoxWidth(12.w),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                sizedBoxHeight(5.h),
                                Text(
                                  'Invite and Earn',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                                sizedBoxHeight(5.h),
                                Text(
                                  'Share with your friends & family to earn points!',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp),
                                ),
                                sizedBoxHeight(10),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              sizedBoxHeight(50.h),
                              GestureDetector(
                                onTap: () {
                                  share();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Text(
                                    'Invite',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    sizedBoxHeight(15.h),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget keyContainer(String txt, String svg, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(15.w, 16.h, 30.w, 16.h),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(8.r)),
        width: MediaQuery.of(context).size.width / 2 - 36.w,
        height: 150.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/svg/$svg.svg',
                  height: 35.h,
                  width: 35.h,
                ),

                Container(
                  height: 27.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      color: AppColors.buttonGrey54595F,
                      borderRadius: BorderRadius.circular(8.h)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textWhite14Robo("20"),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Image.asset(
                          'assets/svg/Coin.png',
                          width: 20.h,
                          height: 20.h,
                        ),
                      ),
                      // Column(
                      //   children: [
                      //     Obx(
                      //       () => Text(
                      //         totalCoins.string,
                      //         style: TextStyle(
                      //             fontSize: 17.sp,
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //     ),
                      //     sizedBoxHeight(5.h)
                      //   ],
                      // ),
                    ],
                  ),
                )
                // RotationTransition(
                //   turns: const AlwaysStoppedAnimation(180 / 360),
                //   child: Icon(
                //     Icons.arrow_back_ios,
                //     size: 14.h,
                //   ),
                // ),
              ],
            ),
            sizedBoxHeight(10.h),
            Text(
              txt,
              style: TextStyle(
                  color: AppColors.grey54595F,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget catContainer(Color color, String txt, String svg) {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 18.w, vertical: 23.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ], color: color, borderRadius: BorderRadius.circular(8.r)),
      width: MediaQuery.of(context).size.width / 2 - 36.w,
      height: 150.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/svg/$svg.svg',
            height: 60.h,
            width: 45.w,
          ),
          sizedBoxHeight(5.h),
          Text(
            txt,
            style: TextStyle(
                color: AppColors.grey54595F,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp),
          ),
        ],
      ),
    );
  }

  Widget redeemContainer() {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 18.w, vertical: 23.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ], color: Colors.grey, borderRadius: BorderRadius.circular(8.r)),
      width: MediaQuery.of(context).size.width / 2 - 36.w,
      height: 150.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/svg/lock.svg',
            height: 18.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/svg/gift.svg',
                color: Colors.white.withOpacity(0.25),
                height: 50.h,
              ),
              Text(
                'Redeem',
                style: TextStyle(
                    color: AppColors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp),
              ),
            ],
          ),
          const SizedBox(),
          const SizedBox(),
        ],
      ),
    );
  }
}
