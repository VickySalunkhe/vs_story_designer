import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../domain/sevices/save_as_image.dart';
import '../../presentation/utils/constants/item_type.dart';
import '../../presentation/utils/constants/text_animation_type.dart';
import '../../presentation/utils/designer_variable_state.dart';

onSubmitClick(context, Function? renderWidget, String fileName,
    Function(String imageUri) onDone, bool exitOnSubmit) async {
  if (!exitOnSubmit) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  color: Colors.white,
                  child: Container(
                      padding: const EdgeInsets.all(50),
                      child: const CircularProgressIndicator())),
            ],
          );
        });
  }
  bool createVideo = false;
  for (var element in designerItemNotifier.draggableWidget) {
    if (element.type == ItemType.gif ||
        element.animationType != TextAnimationType.none) {
      // setState(() {
      createVideo = true;
      // });
    }
  }

  log("before timer");
  Timer(const Duration(seconds: 2), () async {
    if (createVideo) {
      debugPrint('creating video');
      await renderWidget!();
    } else {
      debugPrint('creating image');
      takePicture(
              // contentKey: contentKey,
              // controlNotifier: controlNotifier,
              // context: context,
              saveToGallery: false,
              fileName: fileName)
          .then((bytes) {
        if (!exitOnSubmit) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        log("here 1");

        if (bytes != null) {
          // pngUri = bytes;
          onDone(bytes);
        } else {
          debugPrint("error");
        }
        log("here 2");
      });
    }
  });
  log("after timer");
}
