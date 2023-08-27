import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/Model/CommunityChatListModel.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/community_chatdetails_service.dart';
import 'package:foodspeciality/services/community_chatlist_service.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

class ChatCommunityPage extends StatefulWidget {
  const ChatCommunityPage({Key? key}) : super(key: key);

  @override
  _ChatCommunityPageState createState() => _ChatCommunityPageState();
}

class _ChatCommunityPageState extends State<ChatCommunityPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController _filterController = TextEditingController();
  String _filterUsername = '';
  final communitykey = GlobalKey<FormState>();
  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   SystemChannels.textInput.invokeMethod('TextInput.hide');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
            child: TextField(
              style: TextStyle(fontSize: 16.sp),
              controller: _filterController,
              onChanged: (value) {
                setState(() {
                  _filterUsername = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle:
                    TextStyle(fontSize: 15.sp, color: Colors.grey.shade600),
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20.sp,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8.sp),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: Color(0xFF707070),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: Color(0xFF707070),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 0.h),
              child: StreamBuilder<CommunityChatListModel>(
                  stream:
                      CommunityChatRoomService().getCommunityChatRoomsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: const CircularProgressIndicator(),
                      ); // Loading indicator
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final CommunityChatRooms = snapshot.data!.data;
                      final filteredCommunityChatRooms = CommunityChatRooms!
                          .where(
                            (chatRoom) => chatRoom.name!.toLowerCase().contains(
                                  _filterUsername.toLowerCase(),
                                ),
                          )
                          .toList();

                      // community member username
                      List<String> memberUsernames = [];

                      for (var chatRoom in filteredCommunityChatRooms) {
                        for (var member in chatRoom.members!) {
                          memberUsernames.add(member.user!.username!);
                        }
                      }

                      // community member profile image
                      List<String> memberProfileImage = [];
                      for (var chatRoom in filteredCommunityChatRooms) {
                        for (var member in chatRoom.members!) {
                          memberProfileImage
                              .add(member.user!.profileImage ?? "");
                        }
                      }

                      // community member id
                      List<String> membersId = [];
                      for (var chatRoom in filteredCommunityChatRooms) {
                        for (var member in chatRoom.members!) {
                          membersId.add(member.user!.id!);
                        }
                      }

                      // community member first name
                      List<String> memberFirstname = [];
                      for (var chatRoom in filteredCommunityChatRooms) {
                        for (var member in chatRoom.members!) {
                          memberFirstname.add(member.user!.firstName!);
                        }
                      }

                      return ListView.builder(
                        itemCount: filteredCommunityChatRooms.length,
                        shrinkWrap: true,
                        // padding: EdgeInsets.only(top: 16),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                "/chatcommunitydetail",
                                arguments: {
                                  "communityId":
                                      filteredCommunityChatRooms[index].id,
                                  "communityName":
                                      filteredCommunityChatRooms[index].name,
                                  "communityDescription":
                                      filteredCommunityChatRooms[index]
                                          .description,
                                  "communityProfileImage":
                                      filteredCommunityChatRooms[index]
                                          .profileImage,
                                  "members": filteredCommunityChatRooms[index]
                                      .members!
                                      .length
                                      .toString(),
                                  "membersName": memberUsernames,
                                  "membersPrifileImage": memberProfileImage,
                                  "membersfirstname": memberFirstname,
                                  "membersId":
                                      filteredCommunityChatRooms[index].members,
                                  "adminId":
                                      filteredCommunityChatRooms[index].adminId,
                                },
                              );
                              CommunityChatDetailService()
                                  .getCommunityChatDetailData(
                                      filteredCommunityChatRooms[index].id ??
                                          "");
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 16.w,
                                  right: 16.w,
                                  top: 10.h,
                                  bottom: 10.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "http://77.68.102.23:8000/${filteredCommunityChatRooms[index].profileImage}"),
                                          maxRadius: 30.r,
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  filteredCommunityChatRooms[
                                                          index]
                                                      .name!,
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontFamily: "Roboto",
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 7.h,
                                                ),
                                                Text(
                                                  "${filteredCommunityChatRooms[index].members!.length.toString()} members",
                                                  style: TextStyle(
                                                      fontFamily: "Roboto",
                                                      fontSize: 15.sp,
                                                      color: const Color(
                                                          0xFF54595F),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                filteredCommunityChatRooms[
                                                            index]
                                                        .chats!
                                                        .isEmpty
                                                    ? Text("")
                                                    : Text(
                                                        filteredCommunityChatRooms[
                                                                index]
                                                            .chats!
                                                            .last
                                                            .message!,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Roboto",
                                                            fontSize: 15.sp,
                                                            color: Colors
                                                                .grey.shade800,
                                                            fontWeight: (index ==
                                                                        0 ||
                                                                    index ==
                                                                        3 ||
                                                                    index == 2)
                                                                ? FontWeight
                                                                    .bold
                                                                : FontWeight
                                                                    .normal),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('No data available'),
                      );
                    }
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  // ignore: deprecated_member_use
                  primary: const Color(0xFF3B3F43),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF707070)),
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_circle_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Text(
                      "New Community",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontFamily: 'StudioProR',
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => addCommunityDailog());
                },
              ),
            ),
          ),
          sizedBoxHeight(100.h)
        ],
      ),
    );
  }

  Widget addCommunityDailog() {
    TextEditingController communityName = TextEditingController();
    TextEditingController description = TextEditingController();
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(16.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.h),
              color: AppColors.white,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 25.h),
              child: Form(
                key: communitykey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            size: 30.h,
                            color: AppColors.greyM707070,
                          ),
                        ),
                      ],
                    ),
                    sizedBoxHeight(20.h),
                    SizedBox(
                      width: 200.w,
                      // height: 30.h,
                      child: TextFormField(
                        //    controller: communityName,
                        style: TextStyle(
                            color: const Color(0xFF979797),
                            fontSize: 20.sp,
                            fontFamily: "StudioProR"),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: const Color(0xFF979797),
                              fontSize: 20.sp,
                              fontFamily: "StudioProR"),
                          hintText: "Community Name",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    sizedBoxHeight(15.h),
                    TextFormField(
                      //     controller: description,
                      style: TextStyle(
                          color: const Color(0xFF979797),
                          fontSize: 20.sp,
                          fontFamily: "StudioProR"),
                      cursorColor: const Color(0xFFFFB600),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(14.sp),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: const Color(0xFF979797), width: 0.5.w),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: const Color(0xFF979797), width: 0.5.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: const Color(0xFF979797), width: 0.5.w),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(color: Colors.red, width: 1.w),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(color: Colors.red, width: 1.w),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "StudioProR",
                            color: const Color(0x80000000),
                            fontSize: 17.sp),
                        hintText: "Community Description",
                      ),
                      minLines: 4,
                      maxLines: null,
                    ),
                    sizedBoxHeight(15.h),
                    SizedBox(
                      height: 50.h,
                      width: 170.w,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            // ignore: deprecated_member_use
                            primary: const Color(0xFF3B3F43),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFF707070)),
                              borderRadius: BorderRadius.circular(8.h),
                            ),
                          ),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'StudioProR',
                            ),
                          ),
                          onPressed: () {
                            final FormState? form = communitykey.currentState;
                            if (form != null && form.validate()) {
                              // Validated successfully
                              Get.toNamed(
                                "/communityaddparticipants",
                                arguments: {
                                  "name": communityName.text,
                                  "description": description.text,
                                },
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: -50.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5.w,
                        color: AppColors.greyL979797,
                        spreadRadius: 2.w)
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.h,
                  child: SvgPicture.asset("assets/community.svg"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
