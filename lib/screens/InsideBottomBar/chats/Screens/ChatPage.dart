import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/Model/PrivateChatListModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/services/private_chatdetail_service.dart';
import 'package:foodspeciality/services/private_chatlist_service.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController _filterController = TextEditingController();
  String _filterUsername = '';

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            // height: 50.h,++
            padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
            child: TextField(
              style: TextStyle(fontSize: 16.sp),
              controller: _filterController,
              onChanged: (value) {
                setState(() {
                  _filterUsername = value;
                });
                // marketTickerList = marketTickerListStore.where((tName) {
                //     var tNameTitle = tName["pair"].toLowerCase();
                //     return tNameTitle.contains(text);
                //   }).toSet().toList();
                // setState(() {
                // });
              },
              decoration: InputDecoration(
                hintText: "search",
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
              child: StreamBuilder<PrivateChatListModel>(
                stream: ChatRoomService().getChatRoomsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    ); // Loading indicator
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final chatRooms = snapshot.data!.data;
                    final filteredChatRooms = chatRooms!
                        .where((chatRoom) =>
                            chatRoom.user!.username!.toLowerCase().contains(
                                  _filterUsername.toLowerCase(),
                                ) &&
                            chatRoom.user?.id != myUserId &&
                            chatRoom.user != null)
                        .toList();
                    return ListView.builder(
                      itemCount: filteredChatRooms.length,
                      shrinkWrap: true,
                      // padding: EdgeInsets.only(top:  16.h),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        String originalDate =
                            filteredChatRooms[index].user!.createdAt!;
                        DateTime parsedDate = DateTime.parse(originalDate);
                        String formattedDate =
                            DateFormat("MMMMd").format(parsedDate);
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed("/chatdetail", arguments: {
                              "userid": filteredChatRooms[index].user!.id,
                              "username":
                                  filteredChatRooms[index].user!.username,
                              "profileimage":
                                  filteredChatRooms[index].user!.profileImage,
                              "targetUserId": filteredChatRooms[index].user!.id
                            });
                            PrivateChatDetailService().getPrivateChatDetailData(
                                filteredChatRooms[index].user!.id ?? "");
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 16.w,
                                right: 16.w,
                                top: 10.h,
                                bottom: 10.w),
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
                                            "http://77.68.102.23:8000/${filteredChatRooms[index].user!.profileImage}"),
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
                                                filteredChatRooms[index]
                                                    .user!
                                                    .username!,
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
                                                filteredChatRooms[index]
                                                    .message!,
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 15.sp,
                                                    color: Colors.grey.shade800,
                                                    fontWeight: (index == 0 ||
                                                            index == 3 ||
                                                            index == 2)
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    (index == 0 || index == 1)
                                        ? CircleAvatar(
                                            backgroundColor:
                                                AppColors.greyD3B3F43,
                                            radius: 11.h,
                                            child: Center(
                                                child: textWhite12Robo("2")),
                                          )
                                        : const SizedBox(),
                                    sizedBoxHeight(
                                        (index == 0 || index == 1) ? 5.h : 0),
                                    textgreyD10Robo(formattedDate)
                                  ],
                                )
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
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
