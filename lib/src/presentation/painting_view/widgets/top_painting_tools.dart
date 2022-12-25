// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/control_provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/painting_notifier.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/painting_type.dart';
import 'package:vs_story_designer/src/presentation/widgets/tool_button.dart';

class TopPaintingTools extends StatefulWidget {
  const TopPaintingTools({Key? key}) : super(key: key);

  @override
  _TopPaintingToolsState createState() => _TopPaintingToolsState();
}

class _TopPaintingToolsState extends State<TopPaintingTools> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ControlNotifier, PaintingNotifier>(
      builder: (context, controlNotifier, paintingNotifier, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Container(
            color: Colors.transparent,
            child: Row(
              //  mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// remove last line
                if (paintingNotifier.lines.isNotEmpty)
                  ToolButton(
                    onTap: paintingNotifier.removeLast,
                    onLongPress: paintingNotifier.clearAll,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    backGroundColor: Colors.black12,
                    child: Transform.scale(
                        scale: 0.6,
                        child: const ImageIcon(
                          AssetImage('assets/icons/return.png',
                              package: 'vs_story_designer'),
                          color: Colors.white,
                        )),
                  ),

                /// select pen
                Row(
                  children: [
                    ToolButton(
                      onTap: () {
                        paintingNotifier.paintingType = PaintingType.pen;
                      },
                      colorBorder:
                          paintingNotifier.paintingType == PaintingType.pen
                              ? Colors.black
                              : Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      backGroundColor:
                          paintingNotifier.paintingType == PaintingType.pen
                              ? Colors.white.withOpacity(0.9)
                              : Colors.black12,
                      child: Transform.scale(
                          scale: 1.2,
                          child: ImageIcon(
                            const AssetImage('assets/icons/pen.png',
                                package: 'vs_story_designer'),
                            color: paintingNotifier.paintingType ==
                                    PaintingType.pen
                                ? Colors.black
                                : Colors.white,
                          )),
                    ),
                    // ignore: prefer_const_constructors
                    // SizedBox(
                    //   width: 12,
                    // ),
                    ToolButton(
                      onTap: () {
                        paintingNotifier.paintingType = PaintingType.marker;
                      },
                      colorBorder:
                          paintingNotifier.paintingType == PaintingType.marker
                              ? Colors.black
                              : Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      backGroundColor:
                          paintingNotifier.paintingType == PaintingType.marker
                              ? Colors.white.withOpacity(0.9)
                              : Colors.black12,
                      child: Transform.scale(
                          scale: 1.2,
                          child: ImageIcon(
                            const AssetImage('assets/icons/marker.png',
                                package: 'vs_story_designer'),
                            color: paintingNotifier.paintingType ==
                                    PaintingType.marker
                                ? Colors.black
                                : Colors.white,
                          )),
                    ),
                    // SizedBox(
                    //   width: 12,
                    // ),

                    /// select marker
                    ToolButton(
                      onTap: () {
                        paintingNotifier.paintingType = PaintingType.neon;
                      },
                      colorBorder:
                          paintingNotifier.paintingType == PaintingType.neon
                              ? Colors.black
                              : Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      backGroundColor:
                          paintingNotifier.paintingType == PaintingType.neon
                              ? Colors.white.withOpacity(0.9)
                              : Colors.black12,
                      child: Transform.scale(
                          scale: 1.2,
                          child: ImageIcon(
                            const AssetImage('assets/icons/neon.png',
                                package: 'vs_story_designer'),
                            color: paintingNotifier.paintingType ==
                                    PaintingType.neon
                                ? Colors.black
                                : Colors.white,
                          )),
                    ),
                  ],
                ),

                /// select marker

                /// select neon marker

                /// done button
                // GestureDetector(
                //   onTap: () {
                //     controlNotifier.isPainting = !controlNotifier.isPainting;
                //     paintingNotifier.resetDefaults();
                //   },
                //   child: Align(
                //     alignment: Alignment.topRight,
                //     child: Padding(
                //       padding: const EdgeInsets.only(right: 10, top: 10),
                //       child: Container(
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 6, horizontal: 12),
                //         decoration: BoxDecoration(
                //             color: Colors.transparent,
                //             border: Border.all(color: Colors.white, width: 1.5),
                //             borderRadius: BorderRadius.circular(15)),
                //         child: const Text(
                //           'Done',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 15,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    controlNotifier.isPainting = !controlNotifier.isPainting;
                    paintingNotifier.resetDefaults();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                // ToolButton(
                //   onTap: () {
                //     controlNotifier.isPainting = !controlNotifier.isPainting;
                //     paintingNotifier.resetDefaults();
                //   },
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   backGroundColor: Colors.black12,
                //   child: Transform.scale(
                //       scale: 0.7,
                //       child: const ImageIcon(
                //         AssetImage('assets/icons/check.png',
                //             package: 'vs_story_designer'),
                //         color: Colors.white,
                //       )),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
