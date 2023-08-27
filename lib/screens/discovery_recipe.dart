import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/common_elevatd_button.dart';
import 'package:foodspeciality/screens/bottom_bar.dart';
import 'package:get/get.dart';

class DiscoveryRecipesScreen extends StatefulWidget {
  const DiscoveryRecipesScreen({super.key});

  @override
  State<DiscoveryRecipesScreen> createState() => _DiscoveryRecipesScreenState();
}

class _DiscoveryRecipesScreenState extends State<DiscoveryRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Text(
                  "Discovery Recipes",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 25.h,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF54595F)),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  "Add your cuisine preference of choice and\ndiscover versitile and exciting recipes!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16.sp,
                      color: const Color.fromRGBO(112, 112, 112, 1)),
                ),
              ),
              SizedBox(
                height: 37.h,
              ),
              Container(
                height: 50.h,
                width: 250.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                    child: Text(
                  "South Africa Cuisine",
                  style: TextStyle(
                      color: const Color(0xFF414141),
                      fontFamily: "StudioProR",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Wrap(
                  spacing: 15.w,
                  runSpacing: 15.h,
                  children: [
                    CommonElevatedButton(text: "Limpopo"),
                    CommonElevatedButton(text: "Mpumalanga"),
                    CommonElevatedButton(text: "North West"),
                    CommonElevatedButton(text: "Free-State"),
                    CommonElevatedButton(text: "Eastern Cape"),
                    CommonElevatedButton(text: "Western Cape"),
                    CommonElevatedButton(text: "KwaZulu-Natal"),
                    CommonElevatedButton(text: "Northern Cape"),
                    CommonElevatedButton(text: "Gauteng"),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 50.h,
                width: 250.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                    child: Text(
                  "International Cuisine",
                  style: TextStyle(
                      color: const Color(0xFF414141),
                      fontFamily: "StudioProR",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Wrap(
                  spacing: 15.w,
                  runSpacing: 15.h,
                  children: [
                    CommonElevatedButton(text: "Indian"),
                    CommonElevatedButton(text: "Japanese"),
                    CommonElevatedButton(text: "Italian"),
                    CommonElevatedButton(text: "Mexican"),
                    CommonElevatedButton(text: "Portuguese"),
                    CommonElevatedButton(text: "Moroccan"),
                    CommonElevatedButton(text: "Chinese"),
                    CommonElevatedButton(text: "American"),
                    CommonElevatedButton(text: "Thai"),
                    CommonElevatedButton(text: "German"),
                    CommonElevatedButton(text: "French"),
                    CommonElevatedButton(text: "Spanish"),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 50.h,
                width: 250.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Others",
                      style: TextStyle(
                          color: const Color(0xFF414141),
                          fontFamily: "StudioProR",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Wrap(
                  spacing: 15.w,
                  runSpacing: 15.h,
                  children: [
                    CommonElevatedButton(text: "Make it yum !"),
                    CommonElevatedButton(text: "Quarter too quick"),
                    CommonElevatedButton(text: "Juicy Mondays"),
                    CommonElevatedButton(text: "The healthy way"),
                    CommonElevatedButton(text: "Fry – day!"),
                    CommonElevatedButton(text: "The future of Tradition"),
                    CommonElevatedButton(text: "Simple greens"),
                    CommonElevatedButton(text: "Deliciously diverse"),
                    CommonElevatedButton(text: "Meals for one!"),
                    CommonElevatedButton(text: "Get your veg on"),
                    CommonElevatedButton(text: "From pizza, with love"),
                    CommonElevatedButton(text: "Follow the flavours"),
                    CommonElevatedButton(text: "Good mood food"),
                    CommonElevatedButton(text: "Make it Shhhnacky!"),
                  ],
                ),
              ),
              SizedBox(
                height: 64.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomNextButton(
                  text: "Next",
                  ontap: () {
                    Get.to(BottomBar(),
                        duration: const Duration(milliseconds: 500),
                        transition: Transition.rightToLeft);
                    //Get.toNamed("/bottomBar");
                  },
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
