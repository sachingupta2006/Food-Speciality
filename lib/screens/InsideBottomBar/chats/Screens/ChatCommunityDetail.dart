import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/Model/MessageModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/screens/bottom_bar.dart';
import 'package:foodspeciality/services/community_chatdetails_service.dart';
import 'package:foodspeciality/services/delete_community_service.dart';
import 'package:foodspeciality/services/exit_community_service.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../Model/CommunityChatdetailModel.dart';

class ChatCommunityDetail extends StatefulWidget {
  const ChatCommunityDetail({Key? key}) : super(key: key);

  @override
  _ChatCommunityDetailState createState() => _ChatCommunityDetailState();
}

class _ChatCommunityDetailState extends State<ChatCommunityDetail> {
  late IO.Socket socket;

  ScrollController myController = ScrollController();
  final TextEditingController _communityMessageController =
      TextEditingController();
  final communityId = Get.arguments["communityId"];
  final communityProfileImage = Get.arguments["communityProfileImage"];
  final communityName = Get.arguments["communityName"];
  final communityDescription = Get.arguments["communityDescription"];
  final communitymembers = Get.arguments["members"];
  final membersName = Get.arguments["membersName"];
  final membersProfileImage = Get.arguments["membersPrifileImage"];
  final membersId = Get.arguments["membersId"];
  final memberFirstname = Get.arguments["memberFirstname"];
  final adminId = Get.arguments["adminId"];

  List<CommunityMessageModel> Commessages = [];
  Future<CommunityChatDetailModel>? myfuture;

  void _handleExitCommunityButton(id) async {
    try {
      var resp = await ExitCommunityService.exitCommunity(id ?? "");
      if (resp) {
        Get.to(() => BottomBar(
              selectedIndex: 3,
            ));
      }
    } catch (e) {
      // Handle error here
      print('Error Following user: $e');
    }
  }

  void _handleDeleteCommunityButton(id) async {
    try {
      var resp = await DeleteCommunityService.deleteCommunity(id ?? "");
      if (resp) {
        Get.to(() => BottomBar(
              selectedIndex: 3,
            ));
      }
    } catch (e) {
      // Handle error here
      print('Error Following user: $e');
    }
  }

  @override
  void initState() {
    // _scrollDown();
    connect();
    myfuture = CommunityChatDetailService()
        .getCommunityChatDetailData(Get.arguments["communityId"]);
    super.initState();
  }

  void connect() {
    socket = IO.io("http://77.68.102.23:8000", {
      "transports": ["websocket"],
      'auth': {'x-auth-token': accessToken},
    });
    socket.connect();
    // socket.emit('message-personal', {
    //   'UserId': "9eefcbc3-b03e-4cfa-b6b6-791a1c24d888",
    //   'message': "hello world",
    // });
    socket.onConnect((_) {
      print('Connected: ${socket.id}');

      // Join the room
      socket.emit('join', {'room': '$communityId', 'type': 'community'});
      // socket.emit('join', {'room': 'YOUR_ROOM_NAME', 'type': 'community'});
    });

    socket.on('message', (data) {
      // Handle received message
      print('Received Message: $data');
      setMessage("receiver", data['message']);
    });

    socket.onConnectError((err) => print(err));

    // // Handle join room event
    // socket.on('join-personal', (data) {
    //   print('Join room event: $data');
    // });
  }

  @override
  void dispose() {
    socket.disconnect();
    _communityMessageController.dispose();
    super.dispose();
  }

  void setMessage(String type, String message) {
    CommunityMessageModel communityMessageModel =
        CommunityMessageModel(type: type, message: message);
    setState(() {
      Commessages.add(communityMessageModel);
    });
  }

  void sendMessage() {
    final message = _communityMessageController.text.trim();
    if (message.isNotEmpty) {
      // Emit a message event to the server
      Map<String, dynamic> messageMap = {
        'room': "$communityId",
        'message': message,
        'other': myImage,
        "type": "community"
        // 'message': {'message': message, 'image': "$myImage"},
      };
      setMessage("source", message);
      socket.emit(
        'message',
        messageMap,
      );
      //   socket.emit('message', messageMap);
      print('Sent message: $messageMap'); // Print the sent message
      _communityMessageController.clear();
    }
  }

  var isonce = true;
  sortMessages() {
    if (isonce) {
      Timer(const Duration(seconds: 2), () {
        for (var i = 0; i < communityChatData!.data!.length; i++) {
          if (communityChatData!.data![i].senderId == myUserId) {
            setMessage("source", communityChatData!.data![i].message!);
          } else {
            setMessage("destination", communityChatData!.data![i].message!);
          }
        }
      });
      isonce = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 50),
        () => myController.jumpTo(myController.position.maxScrollExtent));
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "http://77.68.102.23:8000/${communityProfileImage}"),
                    maxRadius: 20.r,
                  ),
                  // SizedBox(
                  //   width: 12,
                  // ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed("/ViewCommunity", arguments: {
                          "communityId": communityId,
                          "communityProfileImage": communityProfileImage,
                          "communityName": communityName,
                          "communitymembers": communitymembers,
                          "membersName": membersName,
                          "membersProfileImage": membersProfileImage,
                          "membersId": membersId,
                          "memberFirstname": memberFirstname
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            communityName,
                            style: TextStyle(
                                fontFamily: "StudioProR",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            "${communitymembers} Participants",
                            style: TextStyle(
                                color: const Color(0xFF3B3F43),
                                fontSize: 13.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    padding: const EdgeInsets.all(4),
                    color: const Color(0xFFFFFFFF),
                    tooltip: '',
                    child: const Icon(
                      Icons.more_vert,
                      color: Color(0xFF3B3F43),
                    ),
                    onSelected: (value) {
                      if (value == '/logout') {
                      } else if (value == "/myProfile") {
                        Get.toNamed('/myprofile');
                      }
                    },
                    itemBuilder: (BuildContext bc) {
                      return [
                        if (adminId == myUserId)
                          PopupMenuItem(
                            onTap: () =>
                                _handleDeleteCommunityButton(communityId),
                            value: '',
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.delete_outline_rounded,
                                      size: 24.sp,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Delete Community",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Roboto",
                                          fontSize: 16.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        PopupMenuItem(
                          onTap: () => _handleExitCommunityButton(communityId),
                          value: '',
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.exit_to_app,
                                    size: 24.sp,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Exit Community",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Roboto",
                                        fontSize: 16.sp),
                                  ),
                                ],
                              ),
                              //  Divider()
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: FutureBuilder<CommunityChatDetailModel>(
          future: myfuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.data == null) {
              return Text('No data available.');
            } else {
              sortMessages();
              return Stack(
                children: <Widget>[
                  ListView.builder(
                    controller: myController,
                    itemCount: Commessages.length,
                    padding: EdgeInsets.only(top: 10.h, bottom: 60.h),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Commessages[index].type == "source"
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 10.h),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25.r),
                                          bottomLeft: Radius.circular(25.r),
                                          topRight: Radius.circular(25.r),
                                        ),
                                        color: const Color(0xFFE1E1E1),
                                      ),
                                      padding: EdgeInsets.all(16.sp),
                                      child: Text(
                                        Commessages[index].message!,
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15.sp,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.h, vertical: 10.w),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 40.w,
                                      height: 40.h,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          child: Image.network(
                                              "http://77.68.102.23:8000/${Commessages[index].image}")),
                                    ),
                                    SizedBox(width: 10.w),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25.r),
                                            topLeft: Radius.circular(25.r),
                                            bottomRight: Radius.circular(25.r),
                                          ),
                                          color: const Color(0xFFF2F2F2)),
                                      padding: EdgeInsets.all(16.sp),
                                      child: Text(
                                        Commessages[index].message!,
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 16.h, left: 16.w, right: 16.w),
                              child: TextFormField(
                                controller: _communityMessageController,
                                decoration: InputDecoration(
                                  hintText: "Send Message",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade600),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(top: 14.h),
                                    child: InkWell(
                                      onTap: sendMessage,
                                      child: Text(
                                        "Send",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(10.sp),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
