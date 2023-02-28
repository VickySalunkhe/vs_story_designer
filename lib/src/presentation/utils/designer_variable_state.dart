import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/providers/notifiers/control_provider.dart';
import '../../domain/providers/notifiers/draggable_widget_notifier.dart';
import '../../domain/providers/notifiers/gradient_notifier.dart';
import '../../domain/providers/notifiers/painting_notifier.dart';

dynamic designerColorProvider;
dynamic designerPaintingProvider;
dynamic designerItemProvider;
dynamic designerItemNotifier;
dynamic designerControlNotifier;
BuildContext? mainContext;
double? screenHeight, screenWidth;
Size? screenSize;

Future<bool> setDesignerValues() async {
  if (mainContext != null) {
    screenSize = MediaQuery.of(mainContext!).size;
    screenHeight = MediaQuery.of(mainContext!).size.height;
    screenWidth = MediaQuery.of(mainContext!).size.width;
    designerControlNotifier =
        Provider.of<ControlNotifier>(mainContext!, listen: false);
    designerItemNotifier =
        Provider.of<DraggableWidgetNotifier>(mainContext!, listen: false);
    designerColorProvider =
        Provider.of<GradientNotifier>(mainContext!, listen: false);
    designerPaintingProvider =
        Provider.of<PaintingNotifier>(mainContext!, listen: false);
    designerItemProvider =
        Provider.of<DraggableWidgetNotifier>(mainContext!, listen: false);
    return true;
  } else {
    return false;
  }
}
