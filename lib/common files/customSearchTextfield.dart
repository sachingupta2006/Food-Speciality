import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchTextFormField extends StatefulWidget {
  CustomSearchTextFormField({
    Key? key,
    this.validator,
    this.inputFormatters,
    required this.hintText,
    required this.validatorText,
    this.textEditingController,
    this.leadingIcon,
    this.onTap,
    this.suffixIcon,
    this.readonly = false,
    this.isInputPassword = false,
    this.outlineColor = const Color(0xFFFFB600),
    // this.keyboardType,
    this.suffixIconConstraints,
    this.autofocus,
    this.texttype,
    this.focusNode
  }) : super(key: key);

  final dynamic validator;
  final TextEditingController? textEditingController;
  final String hintText;
  final String validatorText;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final bool isInputPassword;
  void Function()? onTap;
  final bool? autofocus;
  final bool readonly;
  final dynamic inputFormatters;
  final Color outlineColor;
  final BoxConstraints? suffixIconConstraints;

  final TextInputType? texttype;
  final FocusNode? focusNode;

  @override
  State<CustomSearchTextFormField> createState() =>
      _CustomSearchtextFormFieldState();
}

class _CustomSearchtextFormFieldState extends State<CustomSearchTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isInputPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: widget.autofocus!,
        style: TextStyle(
          fontSize: 16.sp,
        ),
        focusNode: widget.focusNode,
        // onTap: ontap,
        readOnly: widget.readonly,
        cursorColor: const Color(0xFF3B3F43),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        controller: widget.textEditingController,
        onTap: widget.onTap,
        decoration: InputDecoration(
          suffixIconConstraints: const BoxConstraints(),
          contentPadding: const EdgeInsets.all(17),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Color(0xFF707070), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Color(0xFF707070), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Color(0xFF707070), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          hintStyle: TextStyle(
              color: const Color(0xFF54595F63),
              fontSize: 15.sp,
              fontFamily: "Roboto"),
          hintText: widget.hintText,
          prefixIcon: widget.leadingIcon == null
              ? null
              : Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: widget.leadingIcon!,
                ),
          suffixIcon: widget.isInputPassword
              ? GestureDetector(
                  onTap: () => setState(() => obscureText = !obscureText),
                  child: obscureText
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.lock_open_outlined,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                )
              : widget.suffixIcon,
        ),
        keyboardType: widget.texttype,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters);
  }
}
