import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/recipe_ingre_controller.dart';

class CommonChip extends StatefulWidget {
  const CommonChip({super.key, required this.text});

  final String text;

  @override
  State<CommonChip> createState() => _CommonChipState();
}

class _CommonChipState extends State<CommonChip> {
  late bool _colorchange = true;

  RecipeIngreController recipeIngreController = Get.put(RecipeIngreController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 27.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              // ignore: deprecated_member_use
              primary: _colorchange
                  ? const Color(0xFFE1E1E1)
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
                    fontSize: 11.sp,
                    fontFamily: 'StudioProR',
                  ),
                ),
              ],
            ),
            onPressed: () {
              setState(() {
                _colorchange = !_colorchange;
                if (_colorchange) {
                  recipeIngreController.removeTags(widget.text);
                } else {
                  recipeIngreController.addTags(widget.text);
                }
                print(recipeIngreController.tags);
                // _colorchange = _colorchange ? _colorchange = false : true;
              });
            },
          ),
        ),
      ],
    );
  
  }
}
