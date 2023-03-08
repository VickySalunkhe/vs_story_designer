import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../domain/models/painting_model.dart';
import '../../draggable_items/draggable_widget.dart';
import '../../painting_view/widgets/sketcher.dart';
import '../../utils/designer_variable_state.dart';

designerViewWidget() {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(25),
        gradient:
            //controlNotifier.mediaPath.isEmpty
            designerControlNotifier.switchBGColor ||
                    designerControlNotifier.mediaPath.isEmpty
                ? LinearGradient(
                    colors: designerControlNotifier
                        .gradientColors![designerControlNotifier.gradientIndex],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : LinearGradient(
                    colors: [
                      designerColorProvider.color1,
                      designerColorProvider.color2
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
    child: Stack(
      alignment: Alignment.center,
      children: [
        /// in this case photo view works as a main background container to manage
        /// the gestures of all movable items.
        PhotoView.customChild(
          backgroundDecoration: const BoxDecoration(color: Colors.transparent),
          child: Container(),
        ),

        ///list items
        ...designerItemProvider.draggableWidget
            .map((editableItem) => DraggableWidget(
                  // passedContext: mainContext!,
                  draggableWidget: editableItem,
                )),

        /// finger paint
        IgnorePointer(
          ignoring: true,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: RepaintBoundary(
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight! - 132,
                  child: StreamBuilder<List<PaintingModel>>(
                    stream:
                        designerPaintingProvider.linesStreamController.stream,
                    builder: (context, snapshot) {
                      return CustomPaint(
                        painter: Sketcher(
                          lines: designerPaintingProvider.lines,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
