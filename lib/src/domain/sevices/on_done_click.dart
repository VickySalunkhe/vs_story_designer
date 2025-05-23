import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/sevices/save_as_image.dart';
import '../../presentation/utils/constants/item_type.dart';
import '../../presentation/utils/constants/text_animation_type.dart';
// import '../../presentation/utils/designer_variable_state.dart';

onSubmitClick(context, Function? renderWidget, String fileName,
    Function(String imageUri) onDone, bool exitOnSubmit) async {
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

  bool createVideo = false;
  for (var element in designerItemNotifier.draggableWidget) {
    if (element.type == ItemType.gif ||
        element.animationType != TextAnimationType.none) {
      // setState(() {
      createVideo = true;
      // });
    }
  }

  // log("before timer");
  Timer(const Duration(milliseconds: 750), () async {
    if (exitOnSubmit) {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pop(context, "exitOnSubmit");
    }

    if (createVideo) {
      // debugPrint('creating video');
      await renderWidget!();
    } else {
      // debugPrint('creating image');
      takePicture(
              contentKey: contentKey,
              // controlNotifier: controlNotifier,
              context: context,
              saveToGallery: false,
              fileName: fileName)
          .then((bytes) {
        if (!exitOnSubmit) {
          Navigator.of(context, rootNavigator: true).pop();
        }

        if (bytes != null) {
          // pngUri = bytes;
          onDone(bytes);
        } else {
          debugPrint("error");
        }
      });
    }
  });
  // log("after timer");
}
