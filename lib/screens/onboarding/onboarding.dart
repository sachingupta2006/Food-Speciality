import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/login.dart';
// import 'package:foodspeciality/utils/texts.dart';
import 'package:foodspeciality/screens/onboarding/content/onboarding_content.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;

  // var currentIndex = 0.obs;

  late PageController _controller;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 720.h,
                    child: PageView.builder(
                        controller: _controller,
                        onPageChanged: (int index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemCount: contents.length,
                        itemBuilder: (_, i) {
                          return Stack(
                            children: [
                              Image.asset(
                                contents[i].image,
                                height: 740.h,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // sizedBoxHeight(645.h),
                                  textgrey22BoldSP(contents[i].title),
                                  sizedBoxHeight(7.h),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 38.w),
                                    child: textL_grey14Robo(
                                        contents[currentIndex].discription),
                                  ),
                                ],
                              )
                            ],
                          );
                        }),
                  ),
                  Positioned(
                    top: 10.h,
                    child: SizedBox(
                      // width: double.infinity,
                      width: 430.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/onlyLogo.png",
                            height: 93.h,
                            width: 93.h,
                          ),
                          currentIndex == 2
                              ? const SizedBox()
                              : Padding(
                                  padding: EdgeInsets.only(right: 21.w),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () async {
                                        // Get.off(LoginScreen());
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        prefs.setBool("OnBoard", true);
                                        // await prefs.setString('refreshToken', jsonResp["data"]["refreshToken"]);

                                        Get.toNamed("/login");
                                      },
                                      child: textWhite16RoboBold("Skip"),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(10.h),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      contents.length, (index) => buildDot(index))),
              sizedBoxHeight(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: customButtonWithBorder("Continue", onPressed: () async {
                  if (currentIndex == contents.length - 1) {
                    // SharedPreferences pref = await SharedPreferences.getInstance();
                    // pref.setBool("onBoarding_done", true);
                    // Get.off(LoginScreen());
                    //Navigator.push(context, _createRoute());
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool("OnBoard", true);

                    Get.to(() => const Login(),
                        duration: const Duration(milliseconds: 500),
                        transition: Transition.rightToLeft);
                  }
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 6.w,
      width: currentIndex == index ? 24.w : 6.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.h),
        color: currentIndex == index
            ? AppColors.buttonGrey54595F
            : AppColors.buttonGrey54595F,
      ),
    );
  }
}
