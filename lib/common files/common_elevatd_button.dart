// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonElevatedButton extends StatefulWidget {
  var text;

  CommonElevatedButton({
    Key? key,
    GlobalKey<FormState>? form,
    required this.text,
    // this.colorchange = false,
  }) : super(key: key);

  @override
  State<CommonElevatedButton> createState() => _CommonElevatedButtonState();
}

class _CommonElevatedButtonState extends State<CommonElevatedButton> {
  late bool _colorchange = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 36.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              // ignore: deprecated_member_use
              primary: _colorchange
                  ? Colors.white
                  : const Color.fromRGBO(84, 89, 95, 1),
              shape: RoundedRectangleBorder(
                side: _colorchange
                    ? const BorderSide(
                        color: Color.fromARGB(255, 223, 216, 216))
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(11.r),
              ),
            ),
            child: Row(
              children: [
                Visibility(
                    visible: !_colorchange,
                    child: Row(
                      children: [
                        const Image(image: AssetImage("assets/style=bulk.png")),
                        SizedBox(
                          width: 7.42.w,
                        )
                      ],
                    )),
                Text(
                  widget.text,
                  style: TextStyle(
                    color:
                        _colorchange ? const Color(0xFF303030) : Colors.white,
                    fontSize: 14.sm,
                    fontFamily: 'StudioProR',
                  ),
                ),
              ],
            ),
            onPressed: () {
              setState(() {
                _colorchange = !_colorchange;
                // _colorchange = _colorchange ? _colorchange = false : true;
              });
            },
          ),
        ),
      ],
    );
  }
}
