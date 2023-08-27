import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';

class Dessert extends StatefulWidget {
  const Dessert({super.key});

  @override
  State<Dessert> createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(titleTxt: "Blogs/News/Articles"),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.sp),
                            topRight: Radius.circular(30.sp)),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 27.h,
                      child: const Text(''))),
              // leadingWidth: 132.w,
              // leading: Container(
              //   height: 38.h,
              //   width: 135.w,
              //   margin: EdgeInsets.only(
              //     top: 14.h,
              //     left: 18.w,
              //   ),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(19.sp),
              //     color: const Color.fromRGBO(59, 63, 67, 0.71),
              //   ),
              //   child: Center(
              //     child: Text(
              //       "Dessert",
              //       style: TextStyle(
              //           color: const Color(0xffffffff),
              //           fontFamily: "Studio Pro",
              //           fontSize: 18.sp),
              //     ),
              //   ),
              // ),
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 263,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/Chocolate 2.png'))),
                  child: Container(
                    height: 38.h,
                    width: 135.w,
                    margin: EdgeInsets.only(
                        top: 14.h, left: 18.w, right: 280.w, bottom: 200.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.sp),
                      color: const Color.fromRGBO(59, 63, 67, 0.71),
                    ),
                    child: Center(
                      child: Text(
                        "Dessert",
                        style: TextStyle(
                            color: const Color(0xffffffff),
                            fontFamily: "Studio Pro",
                            fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
                centerTitle: true,
              ),
              expandedHeight: 263.h,
              backgroundColor: Colors.white,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => SingleChildScrollView(
                  // physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.sp),
                          topRight: Radius.circular(30.sp)),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    // width: 20,
                    height: 600,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // sizedBoxHeight(17.h),
                          Text(
                            "Kartikey Gautam",
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 16.sp),
                          ),
                          sizedBoxHeight(7.h),
                          Text(
                            "14 October, 2022",
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 10.sp),
                          ),
                          sizedBoxHeight(22.h),
                          Text(
                            "Glutten free pumpkin cookies",
                            style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          sizedBoxHeight(10.h),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an \nunknown \nprinter took a galley of type and scrambled it to make a type specimen book. \n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It \nwas popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more \nrecently \nwith desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some \nform, by injected humour, or randomised words which don't\n look even slightly believable. If you are going to use a \npassage of Lorem Ipsum, you need to be sure there isn't \nanything embarrassing hidden in the middle of text.",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 14.sp,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ), //SliverChildBuildDelegate
            ) //SliverList
          ], //<Widget>[]
        ) //CustonScrollView
        ); //Scaffold
  }
}
