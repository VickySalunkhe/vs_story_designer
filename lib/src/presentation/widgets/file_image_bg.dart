// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:vs_story_designer/src/presentation/utils/color_detection.dart';

class FileImageBG extends StatefulWidget {
  final File? filePath;
  final void Function(Color color1, Color color2) generatedGradient;
  final Size size;
  const FileImageBG(
      {Key? key,
      required this.filePath,
      required this.size,
      required this.generatedGradient})
      : super(key: key);
  @override
  _FileImageBGState createState() => _FileImageBGState();
}

List<Color> imageGradientColorList = [];

class _FileImageBGState extends State<FileImageBG> {
  GlobalKey imageKey = GlobalKey();
  GlobalKey paintKey = GlobalKey();

  GlobalKey? currentKey;

  final StreamController<Color> stateController = StreamController<Color>();
  Color color1 = const Color.fromARGB(255, 107, 28, 211);
  Color color2 = const Color.fromARGB(170, 215, 169, 255);
  Random random = Random();
  @override
  void initState() {
    currentKey = paintKey;
    imageGradientColorList = [color1, color2];
    Timer.periodic(const Duration(milliseconds: 500), (callback) async {
      if (imageKey.currentState != null) {
        if (imageKey.currentState!.context.size!.height == 0.0) {
        } else {
          int cnt = 0;
          do {
            imageGradientColorList = await setColor();
            color1 = imageGradientColorList[0];
            color2 = imageGradientColorList[1];
            cnt++;
            // dev.log("$color1 | $color2");
          } while (imageGradientColorList[0] == imageGradientColorList[1] &&
              cnt < 5);

          setState(() {});
          widget.generatedGradient(color1, color2);
          callback.cancel();
          stateController.close();
        }
      }
    });
    super.initState();
  }

  Future<List<Color>> setColor() async {
    // Color cd1 = await ColorDetection(
    //   currentKey: currentKey,
    //   paintKey: paintKey,
    //   stateController: stateController,
    // ).searchPixel(Offset(imageKey.currentState!.context.size!.width / 2, 480));
    // Color cd2 = await ColorDetection(
    //   currentKey: currentKey,
    //   paintKey: paintKey,
    //   stateController: stateController,
    // ).searchPixel(
    //     Offset(imageKey.currentState!.context.size!.width / 2.03, 530));

    double height = imageKey.currentState!.context.size!.height;
    double width = imageKey.currentState!.context.size!.width;
    Offset offset1 = Offset(
        (width ~/ 3) + random.nextInt(width ~/ 3).toDouble(),
        (height ~/ 3) + random.nextInt(height ~/ 3).toDouble());
    Offset offset2 = Offset(
        (width ~/ 3) + random.nextInt(width ~/ 2).toDouble(),
        (height ~/ 2) + random.nextInt(height ~/ 2).toDouble());
    // dev.log("$offset1 | $offset2");
    Color cd1 = await ColorDetection(
      currentKey: currentKey,
      paintKey: paintKey,
      stateController: stateController,
    ).searchPixel(offset1);
    Color cd2 = await ColorDetection(
      currentKey: currentKey,
      paintKey: paintKey,
      stateController: stateController,
    ).searchPixel(offset2);
    return [cd1, cd2];
  }

  @override
  Widget build(BuildContext context) {
    dynamic _size = widget.size;

    return SizedBox(
        height: _size.height,
        width: _size.width,
        child: RepaintBoundary(
            key: paintKey,
            child: Center(
                child: Image.file(
              File(widget.filePath!.path),
              key: imageKey,
              filterQuality: FilterQuality.high,
            ))));
  }
}
