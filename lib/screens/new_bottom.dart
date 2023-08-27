import 'dart:async';
// import 'package:farm_flow_sales/Utils/sized_box.dart';
// import 'package:farm_flow_sales/Utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/utils/texts.dart';

import '../common files/sized_box.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  late Timer _timer;
  late DateTime _endTime;
  Duration _timeLeft = Duration.zero;
  @override
  void initState() {
    super.initState();
    _setEndTime();
    _startTimer();
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          sizedBoxHeight(200.h),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return claimAlert();
                  },
                );
              },
              child: textBlack10Robo('text')),
          Text(
            _formatTime(_timeLeft),
          ),
        ],
      ),
    );
  }

  AlertDialog claimAlert() {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffD9D9D9).withOpacity(0.33),
                borderRadius: BorderRadius.circular(6)),
          ),
          sizedBoxHeight(20.h),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffD9D9D9).withOpacity(0.33),
                borderRadius: BorderRadius.circular(6)),
          ),
          sizedBoxHeight(20.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(6)),
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
        ],
      ),
    );
  }
}
