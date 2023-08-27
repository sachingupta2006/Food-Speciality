import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonInviteButton extends StatefulWidget {
  final String text;
  final Function(String, bool) onPressed;

  CommonInviteButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CommonInviteButton> createState() => _CommonInviteButtonState();
}

class _CommonInviteButtonState extends State<CommonInviteButton> {
  bool _colorchange = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary:
              _colorchange ? const Color.fromRGBO(84, 89, 95, 1) : Colors.white,
          shape: RoundedRectangleBorder(
            side: _colorchange
                ? BorderSide.none
                : const BorderSide(color: Color.fromARGB(84, 89, 95, 1)),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: _colorchange ? Colors.white : const Color(0xFF303030),
            fontSize: 14.sm,
            fontFamily: 'StudioProR',
          ),
        ),
        onPressed: () {
          setState(() {
            _colorchange = !_colorchange;
          });
          widget.onPressed(widget.text, _colorchange);
        },
      ),
    );
  }
}
