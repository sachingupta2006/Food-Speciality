import 'dart:async';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/recipe_ingredients.dart';
import 'package:foodspeciality/screens/signup_profile.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

var totalCoins = 2000.obs;

class Challenges extends StatefulWidget {
  final int? challengeTabIndex;
  const Challenges({super.key, this.challengeTabIndex});

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  // init
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.challengeTabIndex ?? 0,
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(220.h),
            child: Column(
              children: [
                Container(
                  height: 100.h,
                  color: AppColors.grey54595F,
                  // .withOpacity(0.84),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // sizedBoxHeight(40.w),
                      Container(
                        color: AppColors.grey54595F,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Image.asset(
                                      "assets/icons/back_arrow.png",
                                      height: 15.h,
                                      width: 30.w,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  sizedBoxWidth(10.w),
                                  Text(
                                    "Challenges",
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
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // sizedBoxHeight(5.h),
                                  // Text(
                                  //   "Total Rewards Earned",
                                  //   softWrap: true,
                                  //   textAlign: TextAlign.center,
                                  //   style: TextStyle(
                                  //       fontSize: 12.sp,
                                  //       fontFamily: "Roboto",
                                  //       fontWeight: FontWeight.w400,
                                  //       color: AppColors.white),
                                  // ),
                                  // sizedBoxHeight(9.h),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20.w, 7.h, 20.w, 0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/svg/Coin.png'),
                                        Column(
                                          children: [
                                            Obx(
                                              () => Text(
                                                totalCoins.string,
                                                style: TextStyle(
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            sizedBoxHeight(5.h)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // sizedBoxHeight(25.h)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxHeight(30.w),
                ButtonsTabBar(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                  radius: 32,
                  backgroundColor: const Color(0xffD9D9D9),
                  unselectedBorderColor: const Color(0xffD9D9D9),
                  borderWidth: 1,
                  borderColor: Colors.white,
                  unselectedBackgroundColor: Colors.white,
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: AppColors.grey54595F),
                  labelStyle: TextStyle(
                    color: AppColors.grey54595F,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                  tabs: const [
                    Tab(text: 'Ongoing'),
                    Tab(
                      text: "Available",
                    ),
                    Tab(
                      text: "Completed",
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              firstTab(),
              secondTab(),
              thirdTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget firstTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          sizedBoxHeight(15.h),
          challengeContainer(
            'Upload your profile picture',
            'profileCircle',
            5,
            'Start',
            () {
              Get.to(() => SignupProfile(
                    nextDoneRoute: 1,
                    onTapChallengeDone: () {
                      Get.back();
                      Get.back();
                      Get.to(() => const Challenges(
                            challengeTabIndex: 2,
                          ));
                      totalCoins += 5;
                      showDialog(
                          context: context,
                          builder: (context) => const PPopup(
                                coins: 5,
                              ));
                    },
                  ));
            },
          ),
          sizedBoxHeight(25.h),
          challengeContainer('Upload a recipe', 'UploadRecipe', 20, 'Start',
              () {
            Get.to(() => const RecipeIng());
          }, showNum: true),
        ],
      ),
    );
  }

  Widget secondTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          sizedBoxHeight(15.h),
          challengeContainer('Add bio', 'AddBio', 5, 'Get', () {
            Get.back();
            Get.to(() => const Challenges(
                  challengeTabIndex: 2,
                ));
            totalCoins += 10;
            showDialog(
                context: context,
                builder: (context) => const PPopup(
                      coins: 10,
                    ));
          }),
          sizedBoxHeight(25.h),
          challengeContainer('Connect your social accounts', 'ConnectAccount',
              5, 'Get', () {}),
          sizedBoxHeight(25.h),
          challengeContainer('''Upload a recipe (Max 10 recipes a day)''',
              'UploadRecipe', 20, 'Get', () {}),
          sizedBoxHeight(25.h),
          challengeContainer('Create a community', 'CreateCommunityChallenges',
              5, 'Get', () {}),
          sizedBoxHeight(25.h),
          challengeContainer(
              'Prompt Friends to download app', 'PromptApp', 15, 'Get', () {}),
          sizedBoxHeight(25.h),
        ],
      ),
    );
  }

  Widget thirdTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          sizedBoxHeight(15.h),
          completeContainer('Upload your profile picture', 'profileCircle'),
          sizedBoxHeight(25.h),
        ],
      ),
    );
  }

  Widget challengeContainer(
      String txt, String svg, int coins, String buttonTxt, onTap,
      {bool showNum = false}) {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      width: double.infinity,
      // height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 65.w,
                child: SvgPicture.asset(
                  'assets/svg/$svg.svg',
                  fit: BoxFit.contain,
                ),
              ),
              sizedBoxWidth(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      txt,
                      style: TextStyle(
                          color: AppColors.grey54595F,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ),
                  ),
                  showNum
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxHeight(5.h),

                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                  6,
                                  (index) => Container(
                                        margin: EdgeInsets.only(right: 5.w),
                                        // mar
                                        height: 20.h,
                                        width: 20.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.grey54595F)),
                                        child: Center(
                                            child: textgreyD10Robo(
                                                (index + 1).toString())),
                                        // child: Icon(Icons.check, color: Colors.white,),
                                      )),
                            )
                            // List.generate(length, (index) => null)
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            ],
          ),
          sizedBoxWidth(15.w),
          InkWell(
            onTap: onTap,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/svg/Coin.png',
                      height: 25.h,
                    ),
                    Column(
                      children: [
                        Text(
                          '+$coins',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
                        ),
                        sizedBoxHeight(5.h)
                      ],
                    ),
                    sizedBoxWidth(5.h)
                  ],
                ),
                sizedBoxHeight(8.h),
                Container(
                  width: 60.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      buttonTxt,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget completeContainer(String txt, String svg) {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      width: double.infinity,
      // height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 65.w,
                child: SvgPicture.asset(
                  'assets/svg/$svg.svg',
                  fit: BoxFit.contain,
                ),
              ),
              sizedBoxWidth(10.w),
              SizedBox(
                width: 220.w,
                child: Text(
                  txt,
                  style: TextStyle(
                      color: AppColors.grey54595F,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                ),
              ),
            ],
          ),
          sizedBoxWidth(20.w),
          SvgPicture.asset('assets/svg/completed.svg'),
        ],
      ),
    );
  }
}

class PPopup extends StatefulWidget {
  final int coins;
  const PPopup({super.key, required this.coins});

  @override
  State<PPopup> createState() => _PPopupState();
}

class _PPopupState extends State<PPopup> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(20.h),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              sizedBoxHeight(50.h),
              Text(
                "You Won\n${widget.coins} Coins !",
                style: TextStyle(
                    color: const Color(0xffFFBD00),
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500),
              ),
              sizedBoxHeight(10.h),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffFFA725)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  width: 120.w,
                  height: 40,
                  child: Center(
                    child: Text(
                      "ok",
                      style: TextStyle(
                          color: const Color(0xffFFBD00), fontSize: 14.sp),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0.h,
          bottom: 380,
          child: Center(
            child: SvgPicture.asset(
              'assets/svg/CoinsRecieved.svg',
            ),
          ),
        ),
      ],
    );
  }
}

class PPopupDailyBonus extends StatefulWidget {
  // final int coins;
  const PPopupDailyBonus({
    super.key,
  });

  @override
  State<PPopupDailyBonus> createState() => _PPopupDailyBonusState();
}

class _PPopupDailyBonusState extends State<PPopupDailyBonus> {
  Duration _timeLeft = Duration.zero;
  late DateTime _endTime;
  late Timer _timer;

  List gridData = [
    {"days": "1 day(s)", "text": "+5"},
    {"days": "2 day(s)", "text": "+5"},
    {"days": "3 day(s)", "text": "CLAIM"},
    {"days": "4 day(s)", "text": "CLAIM"},
    {"days": "5 day(s)", "text": "CLAIM"},
    {"days": "6 day(s)", "text": "CLAIM"},
  ];

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  void _setEndTime() {
    DateTime now = DateTime.now();
    DateTime endTime = DateTime(now.year, now.month, now.day, 0, 0,
        0); // Set the end time to today at 12 AM
    if (endTime.isBefore(now)) {
      endTime = endTime.add(const Duration(
          days:
              1)); // If current time is already past 12 AM, set end time to tomorrow
    }
    _endTime = endTime;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        DateTime now = DateTime.now();
        _timeLeft = _endTime.difference(now);
        if (_timeLeft.inSeconds <= 0) {
          _timer.cancel();
        }
      });
    });
  }

  void initState() {
    super.initState();
    _setEndTime();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // barr
      // insetPadding: EdgeInsets.all(10.w),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.h)),
      contentPadding: EdgeInsets.all(20.w),
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 27.h,
                    color: AppColors.grey54595F,
                  ),
                ),
              ),

              sizedBoxHeight(5.h),

              textgreyD18Robo("Daily Bonus"),

              sizedBoxHeight(5.h),

              textgreyD14Robo("Log in everyday and earn rewards!"),

              sizedBoxHeight(20.h),

              Container(
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.h),
                    color: AppColors.greyD9D9D9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textgreyD14Robo("Attended for 3day(s)"),
                  ],
                ),
              ),

              sizedBoxHeight(20.h),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: gridData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 25.w,
                    mainAxisSpacing: 20.h,
                    childAspectRatio: (1 / 1.2)),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Get.toNamed("/InspirationRecipeComment");
                    },
                    child: Container(
                      // padding: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.h),
                          color: AppColors.greyD9D9D9),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textgreyD14Robo(gridData[index]["days"]),
                          // /
                          // sizedBoxHeight(5.h),

                          // imagassets/svg/Coin.png
                          Image.asset(
                            "assets/svg/Coin.png",
                            height: 60.h,
                            width: 60.h,
                            // fit: BoxFit.fill,
                          ),

                          // sizedBoxHeight(5.h),

                          index == 0
                              ? Icon(
                                  Icons.check_circle,
                                  size: 27.h,
                                  color: AppColors.green86BA51,
                                )
                              : Container(
                                  // padding: EdgeInsets.symmetric(
                                  //   horizontal: 8.w,
                                  //   vertical: 2.h
                                  // ),
                                  height: 25.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.h),
                                      color: AppColors.greyM707070),
                                  child: Center(
                                      child: textWhite14Robo(
                                          gridData[index]["text"])),
                                )
                        ],
                      ),
                    ),
                  );
                },
              ),

              sizedBoxHeight(20.h),

              Container(
                // height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.h),
                    color: AppColors.greyD9D9D9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textgreyD14Robo("DAY 7"),

                    // Image.asset(name)
                    Center(
                      child: SvgPicture.asset(
                        "assets/svg/giftBox.svg",
                        height: 80.h,
                        width: 120.w,
                      ),
                    ),

                    sizedBoxHeight(10.h),

                    Center(child: textgreyD14Robo("SUPRISE CHEST"))
                  ],
                ),
              ),

              sizedBoxHeight(20.h),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(6.h)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next chest in',
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff54595F)),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      _formatTime(_timeLeft),
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff54595F)),
                    ),
                  ],
                ),
              ),
              sizedBoxHeight(17.h),
              Padding(
                padding: EdgeInsets.only(right: 35.w),
                child: Text(
                  '* Attendance check resets every midnight \n* Don’t miss a day! Attendance will be reset.\n* The maximum number of World items’ you can get is 99.',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 12.sp),
                ),
              ),

              // GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
            ],
          ),
        ),
      ),
    );
  }
}

class PPopupNew extends StatefulWidget {
  final int coins;
  const PPopupNew({super.key, required this.coins});

  @override
  State<PPopupNew> createState() => _PPopupNewState();
}

class _PPopupNewState extends State<PPopupNew> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        totalCoins = totalCoins + widget.coins;

        // Get.back();
        return true;
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AlertDialog(
            elevation: 0,
            insetPadding: const EdgeInsets.all(0),
            backgroundColor: Colors.black.withOpacity(0.8),
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // contentPadding: EdgeInsets.all(20.h),
            content: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // sizedBoxHeight(50.h),
                  // Text(
                  //   "You Won\n${widget.coins} Coins !",
                  //   style: TextStyle(
                  //       color: const Color(0xffFFBD00),
                  //       fontSize: 30.sp,
                  //       fontWeight: FontWeight.w500),
                  // ),
                  sizedBoxHeight(50.h),
                  SvgPicture.asset(
                    'assets/svg/youWin.svg',
                    height: 325.h,
                  ),
                  sizedBoxHeight(100.h),
                  InkWell(
                    onTap: () {
                      totalCoins = totalCoins + widget.coins;

                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          color: AppColors.grey54595F,
                          borderRadius: BorderRadius.circular(10.h)),
                      width: 199.w,
                      height: 60.h,
                      child: Center(
                        child: Text(
                          "Get ${widget.coins} Coins",
                          style: TextStyle(
                              color: AppColors.white, fontSize: 20.sp),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 0.h,
          //   bottom: 380,
          //   child: Center(
          //     child: SvgPicture.asset(
          //       'assets/svg/CoinsRecieved.svg',
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
