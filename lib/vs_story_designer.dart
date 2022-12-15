// ignore_for_file: must_be_immutable
library vs_story_designer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/control_provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/draggable_widget_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/gradient_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/painting_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/scroll_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/text_editing_notifier.dart';
import 'package:vs_story_designer/src/presentation/main_view/main_view.dart';
// import 'package:vs_story_designer/src/presentation/utils/constants/app_enums.dart';

export 'package:vs_story_designer/vs_story_designer.dart';

enum FontType {
  openSans,
  baskerville,
  cormorant,
  sourceSerifPro,
  sourceSansPro,
  raleway,
  ptSans,
  pacifico,
  breeSerif,
  bonbon,
  ropaSans,
  amiri,
  greatVibes,
  zillaSlab,
  nothingYouCouldDo,
  indieFlower,
  shadowsIntoLight,
  reenieBeanie,
  sueEllenFrancisco,
  kurale,
  dancingScript,
  amatic,
  architect,
  sahitya,
  garamond,
  chewy,
  comfortaa,
  reenie,
  satisfy,
  alfaSlab,
  josefinSans,
  kaushanScript,
  marckScript,
  volkhov,
  squadaOne,
  bahianiata,
  barriecito,
  mountainsOfChristmas,
  righteous,
  geostar,
  patuaOne,
  permanent,
  playfair,
  specialElite,
  courierPrime,
  roboto,
  karma,
  rougeScript,
  rubik,
  siliguri,
  meeraInimai,
  slabo27px,
  poiret,
  reemKufi,
  barlow,
  comicNeue,
  typewriter,
  abrilFatface,
  bebasneue,
  inknutAntiqua,
  lobster,
  khand,
  alegreya,
  montserrat,
  oswald,
  poppins,
  lato
}

class VSStoryDesigner extends StatefulWidget {
  /// editor custom font families
  final List<FontType>? fontFamilyList;

  /// editor custom font families package
  final bool? isCustomFontList;

  /// giphy api key
  final String? giphyKey;

  /// editor custom color gradients
  final List<List<Color>>? gradientColors;

  /// editor custom logo
  final Widget? middleBottomWidget;

  /// on done
  final Function(String)? onDone;

  /// on done button Text
  final Widget? onDoneButtonStyle;

  /// on back pressed
  final Future<bool>? onBackPress;

  /// editor custom color palette list
  final List<Color>? colorList;

  /// editor background color
  final Color? editorBackgroundColor;

  /// gallery thumbnail quality
  final int? galleryThumbnailQuality;

  // Text appearing on center of design screen
  final String? centerText;

  const VSStoryDesigner(
      {Key? key,
      this.giphyKey,
      required this.onDone,
      this.middleBottomWidget,
      this.colorList,
      this.gradientColors,
      this.fontFamilyList,
      this.isCustomFontList,
      this.onBackPress,
      this.onDoneButtonStyle,
      required this.centerText,
      this.editorBackgroundColor,
      this.galleryThumbnailQuality})
      : super(key: key);

  @override
  _VSStoryDesignerState createState() => _VSStoryDesignerState();
}

class _VSStoryDesignerState extends State<VSStoryDesigner> {
  @override
  void initState() {
    Paint.enableDithering = true;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return false;
      },
      child: ScreenUtilInit(
        designSize: const Size(1080, 1920),
        builder: (_, __) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ControlNotifier()),
            ChangeNotifierProvider(create: (_) => ScrollNotifier()),
            ChangeNotifierProvider(create: (_) => DraggableWidgetNotifier()),
            ChangeNotifierProvider(create: (_) => GradientNotifier()),
            ChangeNotifierProvider(create: (_) => PaintingNotifier()),
            ChangeNotifierProvider(create: (_) => TextEditingNotifier()),
          ],
          child: MainView(
            giphyKey: widget.giphyKey,
            onDone: widget.onDone,
            centerText: widget.centerText,
            fontFamilyList: widget.fontFamilyList,
            isCustomFontList: widget.isCustomFontList,
            middleBottomWidget: widget.middleBottomWidget,
            gradientColors: widget.gradientColors,
            colorList: widget.colorList,
            onDoneButtonStyle: widget.onDoneButtonStyle,
            onBackPress: widget.onBackPress,
            editorBackgroundColor: widget.editorBackgroundColor,
            galleryThumbnailQuality: widget.galleryThumbnailQuality,
          ),
        ),
      ),
    );
  }
}
