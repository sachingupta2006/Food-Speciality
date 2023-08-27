import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({Key? key}) : super(key: key);

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  bool light0 = true;
  bool light1 = true;
  bool light2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: "Notification"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxHeight(12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification',
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      color: Colors.black,
                      fontSize: 18.sp,
                    )),
                FlutterSwitch(
                  switchBorder: Border.all(
                      strokeAlign: BorderSide.strokeAlignCenter,
                      style: BorderStyle.solid,
                      width: 1,
                      color: const Color(0xff3B3F43)),
                  padding: 0,
                  borderRadius: 12.sp,
                  width: 55.w,
                  height: 23.h,
                  toggleSize: 22.h,
                  toggleColor: const Color(0xff54595F),
                  activeColor: Colors.white,
                  value: light0,
                  onToggle: (value) {
                    setState(() {
                      light0 = value;
                    });
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text('Messages',
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      color: const Color(0xff444444),
                      fontSize: 16.sp,
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Text('Notification tone',
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      color: Colors.black,
                      fontSize: 20.sp,
                    )),
                SizedBox(
                  height: 6.h,
                ),
                Text('Default',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color(0xff444444),
                      fontSize: 16.sp,
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Text('Vibrate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                    )),
                SizedBox(
                  height: 7.h,
                ),
                Text('Default',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color(0xff444444),
                      fontSize: 16.sp,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
