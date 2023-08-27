// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({
    Key? key,
    GlobalKey<FormState>? form,
    this.ontap,
    required this.text,
    this.colorchange = false,
  }) : super(key: key);

  final String text;
  final GestureTapCallback? ontap;
  final bool colorchange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            // ignore: deprecated_member_use
            primary: colorchange ? Colors.white : const Color(0xFF3B3F43),
            shape: RoundedRectangleBorder(
              side: colorchange
                  ? const BorderSide(color: Color(0xFF707070))
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(8.h),
            ),
          ),
          onPressed: ontap,
          child: Text(
            text,
            style: TextStyle(
              color: colorchange ? const Color(0xFF303030) : Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Productsans',
            ),
          )
          // () {
          //   // ontap!();
          // },
          ),
    );
  }
}
