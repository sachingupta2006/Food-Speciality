import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/publish_popup.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> with SingleTickerProviderStateMixin {
  bool more = false;
  TabController? _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        switch (_tabController!.index) {
          case 0:
            _selectedIndex = 0;

            break;
          case 1:
            _selectedIndex = 1;

            break;
          case 2:
            _selectedIndex = 2;

            break;
          default:
            _selectedIndex = 3;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  Color _getTabColor(int index) {
    if (index == _selectedIndex) {
      return const Color(0xffE1E1E1);
    } else {
      return const Color.fromRGBO(84, 95, 90, 0.71);
    }
  }

  Color _getTextColor(int index) {
    if (index == _selectedIndex) {
      return const Color(0xff000000);
    } else {
      return const Color(0xffFFFFFF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromRGBO(59, 63, 67, 1),
          // leading: InkWell(
          //   onTap: (){
          //     Get.back();
          //   },
          //   child: const Icon(
          //     Icons.arrow_back,
          //   ),
          // ),
          title: Padding(
            padding: EdgeInsets.only(top: 0.h),
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  "assets/icons/back_arrow.png",
                  height: 20.h,
                  width: 30.w,
                  color: AppColors.greyD3B3F43,

                  // color: ,
                )
                // const Icon(
                //   Icons.arrow_back,
                // ),
                ),
          ),
          actions: [
            Center(
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context, builder: (context) => PublishPopup());
                },
                child: Text(
                  "Publish",
                  style: TextStyle(
                      color: const Color(0xff000000),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
                ),
              ),
            ),
            sizedBoxWidth(16.w)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32.r,
                      backgroundColor: Colors.grey,
                      child: const Image(
                          image: AssetImage("assets/Mask Group 40.png")),
                    ),
                    sizedBoxWidth(9.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Namrata Burondkar",
                          style: TextStyle(
                              fontSize: 16.h, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "@Namrata07",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xff979797),
                          ),
                        ),
                        sizedBoxHeight(5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16.sp,
                              color: const Color(0xff54595F),
                            ),
                            Text(
                              "South Africa",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff54595F)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sizedBoxHeight(8.h),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 258.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Mask Group 14.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sizedBoxHeight(26.h),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/media-play-circle-svgrepo-com.svg",
                                height: 63.h,
                                width: 63.h,
                              ),
                              sizedBoxHeight(30.h),
                              sizedBoxHeight(5.h),
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.9),
                                    blurRadius: 25.0, // soften the shadow
                                    spreadRadius: 20.0, //extend the shadow
                                    offset: const Offset(
                                      5.0, // Move to right 5  horizontally
                                      5.0, // Move to bottom 5 Vertically
                                    ),
                                  )
                                ]),
                                height: 35.h,
                                width: double.infinity,
                                child: Text(
                                  "Chomolia Recipe",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 27.h,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 5.w);
                                  },
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selectedIndex = index;
                                          // listCardData[index]["selectedVideoInde"] = index;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.h),
                                            color: index == _selectedIndex
                                                ? AppColors.white
                                                    .withOpacity(0.7)
                                                : AppColors.greyD3B3F43
                                                    .withOpacity(0.7)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7.w, vertical: 5.h),
                                          child: _selectedIndex == index
                                              ? textgreyD12Robo("Video")
                                              : textWhite12Robo("Video"),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              sizedBoxHeight(8.h),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80.h,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14.sp,
                            color: Colors.white,
                          ),
                          sizedBoxWidth(3.w),
                          Text(
                            "30 Min",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'StudioProM',
                                fontSize: 12.sp,
                                color: const Color(0xffFFFFFF)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //   width: double.infinity,
              //   height: 258.h,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/home/food.png"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 16.w),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         SvgPicture.asset(
              //             "assets/svg/media-play-circle-svgrepo-com.svg"),
              //         sizedBoxHeight(50.h),
              //         Container(
              //           decoration: BoxDecoration(boxShadow: [
              //             BoxShadow(
              //               color: Colors.black.withOpacity(0.9),
              //               blurRadius: 25.0, // soften the shadow
              //               spreadRadius: 15.0, //extend the shadow
              //               offset: const Offset(
              //                 5.0, // Move to right 5  horizontally
              //                 5.0, // Move to bottom 5 Vertically
              //               ),
              //             )
              //           ]),
              //           height: 35.h,
              //           width: double.infinity,
              //           child: Text(
              //             "Chomolia Recipe",
              //             style:
              //                 TextStyle(color: Colors.white, fontSize: 20.sp),
              //           ),
              //         ),
              //         SizedBox(
              //             height: 27,
              //             width: double.infinity,
              //             child: TabBar(
              //                 controller: _tabController,
              //                 onTap: (int index) {
              //                   setState(() {
              //                     _selectedIndex = index;
              //                   });
              //                 },
              //                 indicatorColor: Colors.transparent,
              //                 unselectedLabelColor: Colors.amberAccent,
              //                 labelPadding: EdgeInsets.only(right: 9),
              //                 isScrollable: true,
              //                 indicator: null,
              //                 // indicatorWeight: 0,
              //                 tabs: [
              //                   Container(
              //                     height: 27,
              //                     decoration: BoxDecoration(
              //                         color: _getTabColor(0),
              //                         //  Color(0xffE1E1E1),
              //                         borderRadius: BorderRadius.circular(14)),
              //                     child: Center(
              //                       widthFactor: 1.3,
              //                       child: Text(
              //                         "Limpopo",
              //                         style: TextStyle(
              //                             color: _getTextColor(0),
              //                             fontFamily: "Studio Pro",
              //                             fontSize: 10),
              //                       ),
              //                     ),
              //                   ),
              //                   Container(
              //                       height: 27,
              //                       decoration: BoxDecoration(
              //                           color: _getTabColor(1),
              //                           //  Color(0xffE1E1E1),
              //                           borderRadius:
              //                               BorderRadius.circular(14)),
              //                       child: Center(
              //                         widthFactor: 1.3,
              //                         child: Text(
              //                           "Simple greens",
              //                           style: TextStyle(
              //                               color: _getTextColor(1),
              //                               fontFamily: "Studio Pro",
              //                               fontSize: 10),
              //                         ),
              //                       )),
              //                   Container(
              //                       height: 27,
              //                       decoration: BoxDecoration(
              //                           color: _getTabColor(2),
              //                           //  Color(0xffE1E1E1),
              //                           borderRadius:
              //                               BorderRadius.circular(14)),
              //                       child: Center(
              //                         widthFactor: 1.3,
              //                         child: Text(
              //                           "Flavour explosions",
              //                           style: TextStyle(
              //                               color: _getTextColor(2),
              //                               fontFamily: "Studio Pro",
              //                               fontSize: 10),
              //                         ),
              //                       )),
              //                   Container(
              //                       height: 27,
              //                       decoration: BoxDecoration(
              //                           color: _getTabColor(3),
              //                           //  Color(0xffE1E1E1),
              //                           borderRadius:
              //                               BorderRadius.circular(14)),
              //                       child: Center(
              //                         widthFactor: 1.3,
              //                         child: Text(
              //                           "The healthy way",
              //                           style: TextStyle(
              //                               color: _getTextColor(3),
              //                               fontFamily: "Studio Pro",
              //                               fontSize: 10),
              //                         ),
              //                       )),
              //                   // ListView.separated(
              //                   //     scrollDirection: Axis.horizontal,
              //                   //     itemBuilder: (context, index) {
              //                   //       return GestureDetector(
              //                   //         onTap: () {
              //                   //           setState(() {
              //                   //             _selectedItem = index;
              //                   //           });
              //                   //         },
              //                   //         child: Container(
              //                   //           decoration: BoxDecoration(
              //                   //               borderRadius:
              //                   //                   BorderRadius.circular(14.r),
              //                   //               color: index == _selectedItem
              //                   //                   ? const Color(0xffE1E1E1)
              //                   //                       .withOpacity(0.8)
              //                   //                   : const Color.fromRGBO(
              //                   //                           84, 95, 90, 0.71)
              //                   //                       .withOpacity(0.8)),
              //                   //           child: Padding(
              //                   //             padding: EdgeInsets.symmetric(
              //                   //                 horizontal: 7.w, vertical: 5.h),
              //                   //             child: index == 0
              //                   //                 ? Text(
              //                   //                     "Limpopo",
              //                   //                     style: TextStyle(
              //                   //                         fontSize: 10.sp,
              //                   //                         color: const Color(
              //                   //                             0xff000000)),
              //                   //                   )
              //                   //                 : Text(
              //                   //                     "Flavour explodions",
              //                   //                     style: TextStyle(
              //                   //                         fontSize: 10.sp,
              //                   //                         color: const Color(
              //                   //                             0xffFFFFFF)),
              //                   //                   ),
              //                   //           ),
              //                   //         ),
              //                   //       );
              //                   //     },
              //                   //     separatorBuilder: (context, index) {
              //                   //       return SizedBox(width: 5.w);
              //                   //     },
              //                   //     itemCount: 5),
              //                 ])),
              //         sizedBoxHeight(8.h),
              //       ],
              //     ),
              //   ),
              // ),

              DataTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget DataTabBarView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          sizedBoxHeight(26.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/Group 58247.svg",
                height: 29.h,
              ),
              sizedBoxWidth(3.5.w),
              Text(
                "10 Serving",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 12.sp, color: const Color(0xff000000)),
              ),
              sizedBoxWidth(11.5.w),
              SvgPicture.asset(
                "assets/svg/Group 58248.svg",
                height: 29.h,
              ),
              sizedBoxWidth(3.5.w),
              Text(
                "30 Minutes",
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontSize: 12.sp, color: const Color(0xff000000)),
              ),
            ],
          ),
          sizedBoxHeight(15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 17.h, fontWeight: FontWeight.w600),
                ),
                sizedBoxHeight(11.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "chomolia, finely chopped",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "1 Bunch",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
                sizedBoxHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Onion, finely chopped",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
                sizedBoxHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Yellow pepper, finely chopped",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
                sizedBoxHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Olive oil",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "2 TBS",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
                sizedBoxHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Benny spice",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "To Taste",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
              ],
            ),
          ),
          sizedBoxHeight(30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Instructions",
                  style: TextStyle(fontSize: 17.h, fontWeight: FontWeight.w600),
                ),
                sizedBoxHeight(15.h),
                Container(
                  height: 80.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff7070705E)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxWidth(6.w),
                        CircleAvatar(
                          radius: 11.sp,
                          backgroundColor: const Color(0xff6B6B6B),
                          child: Text(
                            "1",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                        sizedBoxWidth(7.w),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xff707070),
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(14.h),
                Container(
                  height: 80.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff7070705E)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxWidth(6.w),
                        CircleAvatar(
                          radius: 11.sp,
                          backgroundColor: const Color(0xff6B6B6B),
                          child: Text(
                            "2",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                        sizedBoxWidth(7.w),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xff707070),
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(14.h),
                Container(
                  // height: 80.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff7070705E)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxWidth(6.w),
                            CircleAvatar(
                              radius: 11.sp,
                              backgroundColor: const Color(0xff6B6B6B),
                              child: Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                            sizedBoxWidth(7.w),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: const Color(0xff707070),
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight(6.h),
                        Image.asset(
                          "assets/Mask Group 24.png",
                          height: 173.h,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        )
                        // Image(
                        //   height: 173.h,
                        //   // fit:
                        //   // ,
                        //   width: double.infinity,
                        //   image: AssetImage("assets/Mask Group 24.png",
                        //     // heigh
                        //   ))
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(14.h),
                Container(
                  // height: 285.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff7070705E)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxWidth(6.w),
                            CircleAvatar(
                              radius: 11.sp,
                              backgroundColor: const Color(0xff6B6B6B),
                              child: Text(
                                "4",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                            sizedBoxWidth(7.w),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: const Color(0xff707070),
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        sizedBoxHeight(6.h),
                        Image.asset(
                          "assets/Mask Group 25.png",
                          height: 173.h,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        )
                        // const Image(
                        //     image: AssetImage("assets/Mask Group 25.png")),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(42.h)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
