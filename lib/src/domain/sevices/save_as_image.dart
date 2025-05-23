import 'dart:io';
import 'dart:typed_data';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../presentation/main_view/widgets/designer_view.dart';

Future takePicture({required saveToGallery, required fileName}) async {
  // try {
  /// converter widget to image
  // RenderRepaintBoundary boundary =
  //     contentKey.currentContext.findRenderObject();

  // ui.Image image = await boundary.toImage(pixelRatio: 3);

  // ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  // Uint8List pngBytes = byteData!.buffer.asUint8List();

  ScreenshotController screenshotController = ScreenshotController();
  Uint8List pngBytes =
      await screenshotController.captureFromWidget(designerViewWidget());

  /// create file
  final String dir = (await getApplicationDocumentsDirectory()).path;
  String imagePath = '$dir/${fileName}_${DateTime.now()}.png';
  File capturedFile = File(imagePath);
  await capturedFile.writeAsBytes(pngBytes);

  if (saveToGallery) {
    final result = await ImageGallerySaverPlus.saveImage(pngBytes,
        quality: 100, name: "${fileName}_${DateTime.now()}.png");
    if (result != null) {
      return true;
    } else {
      return false;
    }
  } else {
    return imagePath;
  }
  // } catch (e) {
  //   log('exception => $e');
  //   return false;
  // }
}
