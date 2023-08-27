import 'package:flutter/material.dart';
import 'package:foodspeciality/common%20files/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class NetworkPlayerWidget extends StatefulWidget {
  const NetworkPlayerWidget({super.key});

  @override
  State<NetworkPlayerWidget> createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  final asset = 'https://vod-progressive.akamaized.net/exp=1677685352~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4182%2F15%2F395912198%2F1683236145.mp4~hmac=7993033cf8bb78ff9faafe5fcffae21d34a4ec4325ea4ebe181818c5786c614a/vimeo-prod-skyfire-std-us/01/4182/15/395912198/1683236145.mp4';
  late VideoPlayerController videoController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    videoController = VideoPlayerController.network(asset)
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
    return VideoPlayerWidget(controller: videoController);
    // return VideoPlayerWidget();
    // return VideoPlayerWidget()
    // return const Placeholder();
  }
}