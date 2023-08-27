import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Pickpage extends StatefulWidget {
  const Pickpage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PickpageState createState() => _PickpageState();
}

class _PickpageState extends State<Pickpage> {
  File? media;

  final ImagePicker _picker = ImagePicker();

  VideoPlayerController? _controller;

  void pickFROMGallery() async {
    final XFile? photo = await _picker.pickVideo(source: ImageSource.gallery);
    if (photo == null) {
      return;
    }
    setState(() {
      media = File(photo.path);

      _controller = VideoPlayerController.file(media!);
      _controller!.initialize();
      _controller!.setLooping(true);
      _controller!.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  pickFROMGallery();
                },
                child: const Text("Upload video"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                color: Colors.green,
                height: 350,
                child: _controller != null
                    ? VideoPlayer(_controller!)
                    : const Text('asdfqwe'),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       if (_controller!.value.isPlaying) {
            //         setState(() {
            //           _controller!.pause();
            //         });
            //       } else {
            //         return setState(() {
            //           _controller!.play();
            //         });
            //       }
            //     },
            //     child: Text(_controller!.value.isPlaying ? 'Pause' : 'Play'))
          ],
        ),
      ),
    );
  }
}
