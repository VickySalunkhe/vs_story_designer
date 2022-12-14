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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Container(
              // padding: EdgeInsets.all(10),
              height: 180,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: const CircleAvatar(radius: 24),
            ),
            const SizedBox(height: 100),
            const Text(
              'Welcome To Story Designer',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'All New Way To Explore Story Views',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 144, 39, 176),
              ),
            ),
            const SizedBox(height: 70),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VSStoryDesigner(
                                // fontFamilyList: const [
                                //   "Oswald",
                                //   "Poppins",
                                //   "Lato"
                                // ],
                                galleryThumbnailQuality: 100,
                                onDone: (uri) {
                                  debugPrint(uri);
                                  Share.shareFiles([uri]);
                                },
                              )));
                },
                child: const Text('Create',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    backgroundColor: const Color.fromARGB(255, 144, 39, 176),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),

                // style: ButtonStyle(
                //   backg,
                //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //     RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(5),

                //       // side: BorderSide(color: Colors.red),
                //     ),
                //   ),
                // ),
              ),
            ),
          ],
        ));
  }
}
