import 'dart:io';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vs_story_designer/vs_story_designer.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter story designer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: RepaintBoundary(
          key: _globalKey,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome To Story Designer',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'All New Way To Explore Story Designer',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    String? mediaPath = await _prepareImage();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VSStoryDesigner(
                                  centerText: "Start Creating Your Story",
                                  // fontFamilyList: const [
                                  //   FontType.abrilFatface,
                                  //   FontType.alegreya,
                                  //   FontType.typewriter
                                  // ],
                                  // middleBottomWidget: const SizedBox(),
                                  themeType: ThemeType
                                      .light, // OPTIONAL, Default ThemeType.dark
                                  galleryThumbnailQuality: 250,
                                  exitOnSubmit: true,
                                  onDone: (uri) {
                                    // debugPrint(uri);
                                    dev.log(uri);
                                    Share.shareFiles([uri]);
                                  },
                                  mediaPath: mediaPath,
                                )));
                  },
                  child: const Text('Create',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  final GlobalKey _globalKey = GlobalKey();

  Future<String?> _prepareImage() async {
    ByteData? byteData;

    try {
      RenderRepaintBoundary? boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;

      ui.Image? image = await boundary?.toImage(pixelRatio: 4);
      byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
      Uint8List bytes = byteData!.buffer.asUint8List();

      final directory = (await getTemporaryDirectory()).path;
      String imgPath = '$directory/${Random().nextInt(999999)}.jpg';
      File imgFile = File(imgPath);
      await imgFile.writeAsBytes(bytes);
      // Uint8List pngBytes = byteData.buffer.asUint8List();
      return imgFile.path;
    } catch (e) {
      return null;
    }
  }
}
