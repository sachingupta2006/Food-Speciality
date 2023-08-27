import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/Model/BlocklistModel.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/blocklist_service.dart';
import 'package:foodspeciality/services/unblock_service.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BlockListFull extends StatefulWidget {
  const BlockListFull({super.key});

  @override
  State<BlockListFull> createState() => _BlockListFullState();
}

class _BlockListFullState extends State<BlockListFull> {
  void _handleUnblockButton(userid, username) async {
    try {
      var resp = await UnblockService.unblockRecipe(userid ?? "");
      if (resp) {
        Get.snackbar("Successful", "Unblocked @${username} successfully");
        setState(() {});
      }
    } catch (e) {
      // Handle error here
      print('Error unblocking user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: "Blocked List"),
      body: FutureBuilder<BlocklistModel>(
        future: BlocklistService().getBlocklistData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final blocklistData = snapshot.data?.data;
              if (blocklistData!.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      sizedBoxHeight(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "These are the people you have blocked. They can't \ncommunicate with you on food specialities",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14.sp,
                                color: const Color(0xff979797)),
                          ),
                        ],
                      ),
                      sizedBoxHeight(47.h),
                      Lottie.asset("assets/setting svg/79572.json"),
                      sizedBoxHeight(58.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Block List Empty",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff000000)),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: blocklistData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        sizedBoxHeight(20.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 16.w,
                            ),
                            Stack(
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: CircleAvatar(
                                    radius: 25.r,
                                    backgroundColor: Colors.grey,
                                    child: Image.network(blocklistData
                                            .elementAt(index)
                                            .profileImage ??
                                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0.h,
                                    left: 35.w,
                                    child: SvgPicture.asset(
                                      "assets/rating-svgrepo-com.svg",
                                      height: 22,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${blocklistData.elementAt(index).firstName} ${blocklistData.elementAt(index).lastName}",
                                  style: TextStyle(
                                      fontFamily: "StudioProR",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF54595F)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "@${blocklistData.elementAt(index).username}",
                                  style: TextStyle(
                                      fontFamily: "StudioProR",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(
                                          59, 63, 67, 0.49)),
                                ),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 31.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1.sp,
                                        color: const Color(0xff3B3F43)),
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.sp))),
                                onPressed: () {
                                  _handleUnblockButton(
                                      blocklistData.elementAt(index).id,
                                      blocklistData.elementAt(index).username);
                                },
                                child: Text(
                                  "Unblock",
                                  style: TextStyle(
                                      fontFamily: 'Studio Pro',
                                      fontSize: 14.sp,
                                      color: const Color(0xff3B3F43)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            )
                          ],
                        ),
                        const Divider(
                          endIndent: 20,
                          indent: 20,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                );
              }
            }
          } else {
            return Container(); // You can show a placeholder or loading state here
          }
        },
      ),
    );
  }
}
