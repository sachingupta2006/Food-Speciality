import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/Model/MessageModel.dart';
import 'package:foodspeciality/Model/PrivateChatDetailModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/services/private_chatdetail_service.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPrivateDetail extends StatefulWidget {
  const ChatPrivateDetail({
    Key? key,
  }) : super(key: key);

  @override
  _ChatPrivateDetailState createState() => _ChatPrivateDetailState();
}

class _ChatPrivateDetailState extends State<ChatPrivateDetail> {
  final TextEditingController _messageController = TextEditingController();
  final username = Get.arguments["username"];
  final profileimage = Get.arguments["profileimage"];
  final userid = Get.arguments["userid"];

  late IO.Socket socket;
  ScrollController myController = ScrollController();

  List<MessageModel> messages = [];
  Future<PrivateChatDetailModel>? myfuture;
  @override
  void initState() {
    connect();
    myfuture = PrivateChatDetailService()
        .getPrivateChatDetailData(Get.arguments["targetUserId"]);
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
      socket.emit('join', {'room': '$myUserId', 'type': 'personal'});
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
    _messageController.dispose();
    super.dispose();
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message);
    setState(() {
      messages.add(messageModel);
    });
  }

  void sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      // Emit a message event to the server
      Map<String, dynamic> messageMap = {
        'room': "$userid",
        'message': message,
      };
      setMessage("source", message);
      socket.emit('message', messageMap);
      //   socket.emit('message', messageMap);
      print('Sent message: $messageMap'); // Print the sent message
      _messageController.clear();
    }
  }

  var isonce = true;
  sortMessages() {
    if (isonce) {
      Timer(const Duration(seconds: 2), () {
        for (var i = 0; i < chatData!.data!.length; i++) {
          if (chatData!.data![i].senderId == myUserId) {
            setMessage(
              "source",
              chatData!.data![i].message!,
            );
          } else {
            setMessage("destination", chatData!.data![i].message!);
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
                          "http://77.68.102.23:8000/${profileimage}"),
                      maxRadius: 20.r,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            username,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13.sp),
                          ),
                        ],
                      ),
                    ),
                    // ignore: prefer_const_constructors
                  ],
                ),
              ),
            ),
          ),
          body: FutureBuilder<PrivateChatDetailModel>(
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
                      itemCount: messages.length,
                      padding: EdgeInsets.only(top: 10.h, bottom: 60.h),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return messages[index].type == "source"
                            ? Sender(message: messages[index].message)
                            : Receiver(
                                message: messages[index].message,
                                profileimage:
                                    Get.arguments["profileimage"] ?? "",
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
                                  controller: _messageController,
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
          )),
    );
  }
}

class Sender extends StatelessWidget {
  const Sender({
    super.key,
    this.message,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
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
                message!,
                style: TextStyle(
                    fontFamily: "Roboto", fontSize: 15.sp, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Receiver extends StatelessWidget {
  const Receiver({super.key, this.message, this.profileimage});

  final String? message;
  final dynamic profileimage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40.w,
              height: 40.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(profileimage),
              ),
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
                message!,
                style: TextStyle(fontFamily: "Roboto", fontSize: 15.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
