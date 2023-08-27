import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/comman_comment.dart';
import 'package:foodspeciality/screens/gridviewuser_content.dart';
import 'package:get/get.dart';

import 'InsideBottomBar/home/controller/home_controller.dart';

class Gridview extends StatefulWidget {
  const Gridview({
    super.key,
  });

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  int currentIndex = 0;
  HomeController controllerHome = Get.put(HomeController());

  // int index = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (0.45 / 0.5),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10),
                itemCount: gridCardData.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed("/InspirationRecipeComment");
                    },
                    child: gridCard(
                        gridCardData[index]["like"],
                        gridCardData[index]["save"],
                        index,
                        gridCardData[index]["recipeimage"],
                        gridCardData[index]["title"],
                        gridCardData[index]["name"]),
                  );
                  // listCardData[index]["isFollowedByMe"]);
                }),
          ],
        ),
      ),
    );
  }

  Widget gridCard(int like, int save, int index, dynamic recipeimage,
      dynamic name, dynamic title) {
    // bool like = false;

    // print(griddata);
    return Container(
        height: 180.h,
        width: 190.w,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: Offset(
              3.0, // Move to right 5  horizontally
              3.0, // Move to bottom 5 Vertically
            ),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(10.h)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.h),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      recipeimage,
                    ),
                  )),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7.0, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontFamily: "Roboto", fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: const Color(0xFF6B6B6B),
                        fontFamily: "Roboto",
                        fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                gridCardData[index]["like"] = like == 0 ? 1 : 0;
                              });
                            },
                            child: like == 0
                                ? Image.asset(
                                    "assets/icons/like.png",
                                    width: 20.w,
                                    height: 18.h,
                                  )
                                : Image.asset(
                                    "assets/icons/like_filled.png",
                                    width: 20.w,
                                    height: 18.h,
                                  ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "55",
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // commentbottomSheet(controllerHome);
                            },
                            child: Image.asset(
                              "assets/icons/comment.png",
                              width: 20.w,
                              height: 18.h,
                            ),
                          ),
                          // SvgPicture.asset(
                          //   "assets/comment.svg",
                          //   height: 16.h,
                          //   width: 19.w,
                          // ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                gridCardData[index]["save"] = save == 0 ? 1 : 0;
                              });
                            },
                            child: save == 0
                                ? Image.asset(
                                    "assets/icons/save.png",
                                    width: 20.w,
                                    height: 18.h,
                                  )
                                : Image.asset(
                                    "assets/icons/save_filled.png",
                                    width: 20.w,
                                    height: 18.h,
                                  ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "35",
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 12.sp),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
