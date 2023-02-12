// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/control_provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/draggable_widget_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/painting_notifier.dart';
import 'package:vs_story_designer/src/domain/sevices/save_as_image.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/item_type.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/text_animation_type.dart';
import 'package:vs_story_designer/src/presentation/utils/modal_sheets.dart';
import 'package:vs_story_designer/src/presentation/widgets/animated_onTap_button.dart';
import 'package:vs_story_designer/src/presentation/widgets/tool_button.dart';

class TopTools extends StatefulWidget {
  final GlobalKey contentKey;
  final BuildContext context;
  final Function? renderWidget;
  const TopTools(
      {Key? key,
      required this.contentKey,
      required this.context,
      this.renderWidget})
      : super(key: key);

  @override
  _TopToolsState createState() => _TopToolsState();
}

class _TopToolsState extends State<TopTools> {
  bool _createVideo = false;
  @override
  Widget build(BuildContext context) {
    return Consumer3<ControlNotifier, PaintingNotifier,
        DraggableWidgetNotifier>(
      builder: (_, controlNotifier, paintingNotifier, itemNotifier, __) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// close button
                ToolButton(
                    backGroundColor: Colors.black12,
                    onTap: () async {
                      exitDialog(
                              context: widget.context,
                              contentKey: widget.contentKey,
                              themeType: controlNotifier.themeType)
                          .then((res) {
                        if (res) Navigator.pop(context);
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),

                Row(
                  children: [
                    if (controlNotifier.mediaPath.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: _selectColor(
                            controlProvider: controlNotifier,
                            onTap: () {
                              if (controlNotifier.gradientIndex >=
                                  controlNotifier.gradientColors!.length - 1) {
                                setState(() {
                                  controlNotifier.gradientIndex = 0;
                                });
                              } else {
                                setState(() {
                                  controlNotifier.gradientIndex += 1;
                                });
                              }
                            }),
                      ),
                    ToolButton(
                      backGroundColor: Colors.black12,
                      onTap: () => controlNotifier.isTextEditing =
                          !controlNotifier.isTextEditing,
                      child: const ImageIcon(
                        AssetImage('assets/icons/text.png',
                            package: 'vs_story_designer'),
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    ToolButton(
                        backGroundColor: controlNotifier.enableTextShadow
                            ? Colors.white
                            : Colors.black12,
                        onTap: () {
                          controlNotifier.enableTextShadow =
                              !controlNotifier.enableTextShadow;
                        },
                        child: Icon(Icons.text_fields_sharp,
                            color: controlNotifier.enableTextShadow
                                ? Colors.black
                                : Colors.white,
                            size: 30)),
                    // ToolButton(
                    //     child: const ImageIcon(
                    //       AssetImage('assets/icons/stickers.png',
                    //           package: 'vs_story_designer'),
                    //       color: Colors.white,
                    //       size: 20,
                    //     ),
                    //     backGroundColor: Colors.black12,
                    //     onTap: () => createGiphyItem(
                    //         context: context,
                    //         giphyKey: controlNotifier.giphyKey)),
                    ToolButton(
                        backGroundColor: Colors.black12,
                        onTap: () {
                          controlNotifier.isPainting = true;
                          //createLinePainting(context: context);
                        },
                        child: const ImageIcon(
                          AssetImage('assets/icons/draw.png',
                              package: 'vs_story_designer'),
                          color: Colors.white,
                          size: 20,
                        )),
                  ],
                ),

                // ToolButton(
                //   child: ImageIcon(
                //     const AssetImage('assets/icons/photo_filter.png',
                //         package: 'vs_story_designer'),
                //     color: controlNotifier.isPhotoFilter ? Colors.black : Colors.white,
                //     size: 20,
                //   ),
                //   backGroundColor:  controlNotifier.isPhotoFilter ? Colors.white70 : Colors.black12,
                //   onTap: () => controlNotifier.isPhotoFilter =
                //   !controlNotifier.isPhotoFilter,
                // ),

                ToolButton(
                    backGroundColor: Colors.black12,
                    onTap: () async {
                      if (paintingNotifier.lines.isNotEmpty ||
                          itemNotifier.draggableWidget.isNotEmpty) {
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
                                          margin: const EdgeInsets.all(50),
                                          child:
                                              const CircularProgressIndicator())),
                                ],
                              );
                            });
                        for (var element in itemNotifier.draggableWidget) {
                          if (element.type == ItemType.gif ||
                              element.animationType != TextAnimationType.none) {
                            setState(() {
                              _createVideo = true;
                            });
                          }
                        }
                        if (_createVideo) {
                          debugPrint('creating video');
                          await widget.renderWidget!();
                        } else {
                          debugPrint('creating image');
                          var response = await takePicture(
                              contentKey: widget.contentKey,
                              context: context,
                              saveToGallery: true,
                              fileName: controlNotifier.folderName);
                          if (response) {
                            Fluttertoast.showToast(msg: 'Successfully saved');
                          } else {}
                        }
                        // ignore: use_build_context_synchronously
                        Navigator.of(context, rootNavigator: true).pop();
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Design something to save image');
                      }

                      setState(() {
                        _createVideo = false;
                      });
                    },
                    child: const ImageIcon(
                      AssetImage('assets/icons/download.png',
                          package: 'vs_story_designer'),
                      color: Colors.white,
                      size: 20,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  /// gradient color selector
  Widget _selectColor({onTap, controlProvider}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
      child: AnimatedOnTapButton(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: controlProvider
                      .gradientColors![controlProvider.gradientIndex]),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
