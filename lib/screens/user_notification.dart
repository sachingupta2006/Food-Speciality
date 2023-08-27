import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:get/get.dart';

class UserNotifications extends StatefulWidget {
  const UserNotifications({super.key});

  @override
  State<UserNotifications> createState() => _UserNotificationsState();
}

class _UserNotificationsState extends State<UserNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleTxt: "Notifications"),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Notifications",
                    //   style: TextStyle(
                    //       fontFamily: 'Studio Pro',
                    //       fontSize: 20.sp,
                    //       fontWeight: FontWeight.w500,
                    //       color: const Color(0xff54595F)),
                    // ),
                    sizedBoxHeight(18.h),
                    Text(
                      "Today",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14.sp,
                          color: const Color(0xff979797)),
                    ),
                  ],
                ),
              ),
              // sizedBoxHeight(22.h),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/user notification/p1.png'),
                ),
                title: Text(
                  "Mokshada Kesarkar started Following you",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000)),
                ),
                subtitle: Text(
                  "\n09.20 AM",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff3B3F43)),
                ),
                trailing: SizedBox(
                  height: 31.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(
                              width: 1.sp, color: const Color(0xff3B3F43)),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp))),
                      onPressed: () {},
                      child: Text(
                        "Following",
                        style: TextStyle(
                            fontFamily: 'Studio Pro',
                            fontSize: 14.sp,
                            color: const Color(0xff3B3F43)),
                      )),
                ),
              ),
              const Divider(
                color: Color(0xff7070707a),
                thickness: 0.2,
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage('assets/user notification/p2.png'),
                ),
                title: Text(
                  "You are invited to join WDIPL Community",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000)),
                ),
                subtitle: Text(
                  "\n09.20 AM",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff3B3F43)),
                ),
                trailing: SizedBox(
                  height: 31.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp))),
                      onPressed: () {
                        buildSubscriptionPlan();
                      },
                      child: Text(
                        "View",
                        style: TextStyle(
                            fontFamily: 'Studio Pro',
                            fontSize: 14.sp,
                            color: Colors.white),
                      )),
                ),
              ),
              const Divider(
                color: Color(0xff7070707a),
                thickness: 0.2,
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/user notification/p3.png'),
                ),
                title: Text(
                  'Priyanka Joshi liked your comment on her post "Nice"',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff000000)),
                ),
                subtitle: Text(
                  "\n09.20 AM",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 10.sp,
                      color: const Color(0xff979797)),
                ),
                trailing: SizedBox(
                  height: 31.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp))),
                      onPressed: () {
                        buildSubscriptionPlan();
                      },
                      child: Text(
                        "View",
                        style: TextStyle(
                            fontFamily: 'Studio Pro',
                            fontSize: 14.sp,
                            color: Colors.white),
                      )),
                ),
              ),
              const Divider(
                color: Color(0xff7070707a),
                thickness: 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Yesterday",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.sp,
                    color: const Color(0xff979797),
                  ),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/user notification/p4.png'),
                ),
                title: Text(
                  "Priyanka Joshi replied to your comment on her post",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff000000)),
                ),
                subtitle: Text(
                  "\n09.20 AM",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 10.sp,
                      color: const Color(0xff979797)),
                ),
                trailing: SizedBox(
                  height: 31.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp))),
                      onPressed: () {
                        buildSubscriptionPlan();
                      },
                      child: Text(
                        "View",
                        style: TextStyle(
                            fontFamily: 'Studio Pro',
                            fontSize: 14.sp,
                            color: Colors.white),
                      )),
                ),
              ),
              const Divider(
                color: Color(0xff7070707a),
                thickness: 0.2,
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/user notification/p5.png'),
                ),
                title: Text(
                  'Priyanka Joshi liked your comment on her post "Nice"',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff000000)),
                ),
                subtitle: Text(
                  "\n09.20 AM",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 10.sp,
                      color: const Color(0xff979797)),
                ),
                trailing: SizedBox(
                  height: 31.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp))),
                      onPressed: () {
                        buildSubscriptionPlan();
                      },
                      child: Text(
                        "View",
                        style: TextStyle(
                            fontFamily: 'Studio Pro',
                            fontSize: 14.sp,
                            color: Colors.white),
                      )),
                ),
              ),
              const Divider(
                color: Color(0xff7070707a),
                thickness: 0.2,
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage('assets/user notification/p2.png'),
                ),
                title: Text(
                  "You are invited to join WDIPL Community",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff000000)),
                ),
                subtitle: Text(
                  "\n09.20 AM",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 10.sp,
                      color: const Color(0xff979797)),
                ),
                trailing: SizedBox(
                  height: 31.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp))),
                      onPressed: () {
                        buildSubscriptionPlan();
                      },
                      child: Text(
                        "View",
                        style: TextStyle(
                            fontFamily: 'Studio Pro',
                            fontSize: 14.sp,
                            color: Colors.white),
                      )),
                ),
              ),
              const Divider(
                color: Color(0xff7070707a),
                thickness: 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "This Weekend",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff979797)),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/user notification/p7.png'),
                ),
                title: Text(
                  "Priyanka Joshi replied to your comment on her post",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff000000)),
                ),
                subtitle: Text(
                  "\n09.20 AM",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 10.sp,
                      color: const Color(0xff979797)),
                ),
                trailing: SizedBox(
                  height: 31.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp))),
                      onPressed: () {
                        buildSubscriptionPlan();
                      },
                      child: Text(
                        "View",
                        style: TextStyle(
                            fontFamily: 'Studio Pro',
                            fontSize: 14.sp,
                            color: Colors.white),
                      )),
                ),
              ),
              const Divider(
                color: Color(0xff7070707a),
                thickness: 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildSubscriptionPlan() {
    return showDialog(
      context: context,
      builder: (context) => Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                  side: const BorderSide(color: Colors.white),
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: const Icon(
                              Icons.close,
                              color: Color(0xff54595F),
                            ),
                          ),
                        )
                      ],
                    ),
                    sizedBoxHeight(10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "WDIPL Community",
                        style: TextStyle(
                            fontFamily: 'Studio Pro',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: const Color(0xff54595F)),
                      ),
                    ),
                    const Divider(
                      color: Color(0xff7070707a),
                      thickness: 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff979797))),
                        margin: EdgeInsets.only(left: 11.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxHeight(9.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Community Description",
                                  style: TextStyle(
                                      fontFamily: 'Studio Pro',
                                      fontSize: 17.sp,
                                      color: const Color(0xff000000)),
                                ),
                              ],
                            ),
                            sizedBoxHeight(8.h),
                            Text(
                              "Lorem Ipsum is simply dummy text \nof the printing and typesetting industry. \nLorem Ipsum has been the industry's",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.sp,
                                  color: const Color(0xff54595F)),
                            ),
                            sizedBoxHeight(20.h),
                          ],
                        ),
                      ),
                    ),
                    sizedBoxHeight(17.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 9.w),
                          child: SizedBox(
                            width: 150.w,
                            height: 40.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        const Color.fromRGBO(84, 89, 95, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.sp))),
                                onPressed: () {
                                  Get.back();
                                  Get.toNamed("/chatcommunitydetail");
                                },
                                child: Text(
                                  "Accept",
                                  style: TextStyle(
                                      fontFamily: 'Studio Pro',
                                      fontSize: 14.sp,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.w, right: 20.w),
                          child: SizedBox(
                            width: 150.w,
                            height: 40.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        const Color.fromRGBO(84, 89, 95, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.sp))),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  "Reject",
                                  style: TextStyle(
                                      fontFamily: 'Studio Pro',
                                      fontSize: 14.sp,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 255.h,
              right: 0,
              left: 0,
              child: CircleAvatar(
                  radius: 44.r,
                  child:
                      Image.asset("assets/user notification/popuplogo.png"))),
        ],
      ),
    );
  }
}
