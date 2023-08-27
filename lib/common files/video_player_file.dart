import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/video_player_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class FilePlayerWidget extends StatefulWidget {
  FilePlayerWidget({
    super.key,
  });

  @override
  State<FilePlayerWidget> createState() => _FilePlayerWidgetState();
}

class _FilePlayerWidgetState extends State<FilePlayerWidget> {
  final asset =
      'https://vod-progressive.akamaized.net/exp=1677685352~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4182%2F15%2F395912198%2F1683236145.mp4~hmac=7993033cf8bb78ff9faafe5fcffae21d34a4ec4325ea4ebe181818c5786c614a/vimeo-prod-skyfire-std-us/01/4182/15/395912198/1683236145.mp4';
  late VideoPlayerController videoController;

  XFile? file;
  @override
  void initState() {
    // TODO: implement initState
    file = Get.arguments;
    super.initState();

    videoController = VideoPlayerController.file(File(file!.path))
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(titleTxt: ""),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VideoPlayerWidget(controller: videoController),
        ],
      ),
    );
    // return VideoPlayerWidget();
    // return VideoPlayerWidget()
    // return const Placeholder();
  }
}
