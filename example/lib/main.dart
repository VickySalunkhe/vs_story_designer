import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vs_story_designer/vs_story_designer.dart';

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
        body: Column(
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
              onPressed: () {
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
                              galleryThumbnailQuality: 100,
                              onDone: (uri) {
                                debugPrint(uri);
                                Share.shareFiles([uri]);
                              },
                            )));
              },
              child: const Text('Create',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ],
        ));
  }
}
