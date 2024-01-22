// ignore_for_file: must_be_immutable, library_private_types_in_public_api
library vs_story_designer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/control_provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/draggable_widget_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/gradient_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/painting_notifier.dart';
// import 'package:vs_story_designer/src/domain/providers/notifiers/rendering_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/scroll_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/text_editing_notifier.dart';
import 'package:vs_story_designer/src/presentation/main_view/main_view.dart';

export 'package:vs_story_designer/vs_story_designer.dart';

enum ThemeType { dark, light }

enum FontType {
  openSans,
  baskerville,
  cormorant,
  sourceSerif,
  sourceSans,
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
  lato,
  b612,
  hindSiliguri,
  titilliumWeb,
  varela,
  vollkorn,
  rakkas,
  hindGuntur,
  concertOne,
  yatraOne,
  notoSansGujarati,
  oldStandardTT,
  neonderthaw,
  bungeeShade,
  passionsConflict,
  sedgwickAve,
  notoNastaliqUrdu,
  sacramento,
  pressStart2P,
  cabinSketch,
  frederickatheGreat,
  tiroDevanagariHindi,
  rubikVinyl,
  ewert,
  unifrakturMaguntia,
}

class VSStoryDesigner extends StatefulWidget {
  /// editor custom font families
  final List<FontType>? fontFamilyList;

  // theme type
  final ThemeType? themeType;

  /// editor custom font families package
  final bool? isCustomFontList;

  /// you can pass a fileName with which image name will be created
  final String? fileName;

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
  final String centerText;

  // share image file path
  final String? mediaPath;

  const VSStoryDesigner(
      {super.key,
      this.giphyKey,
      this.themeType,
      required this.onDone,
      this.middleBottomWidget,
      this.colorList,
      this.gradientColors,
      this.fileName,
      this.fontFamilyList,
      this.isCustomFontList,
      this.onBackPress,
      this.onDoneButtonStyle,
      this.editorBackgroundColor,
      this.galleryThumbnailQuality,
      this.mediaPath,
      required this.centerText});

  @override
  _VSStoryDesignerState createState() => _VSStoryDesignerState();
}

class _VSStoryDesignerState extends State<VSStoryDesigner> {
  @override
  void initState() {
    // Paint.enableDithering = true;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ControlNotifier()),
        ChangeNotifierProvider(create: (_) => ScrollNotifier()),
        ChangeNotifierProvider(create: (_) => DraggableWidgetNotifier()),
        ChangeNotifierProvider(create: (_) => GradientNotifier()),
        ChangeNotifierProvider(create: (_) => PaintingNotifier()),
        ChangeNotifierProvider(create: (_) => TextEditingNotifier()),
        // ChangeNotifierProvider(create: (_) => RenderingNotifier()),
      ],
      child: MainView(
        themeType: widget.themeType ?? ThemeType.dark,
        giphyKey: widget.giphyKey ?? 'C4dMA7Q19nqEGdpfj82T8ssbOeZIylD4',
        onDone: widget.onDone,
        fontFamilyList: widget.fontFamilyList,
        isCustomFontList: widget.isCustomFontList,
        middleBottomWidget: widget.middleBottomWidget,
        gradientColors: widget.gradientColors,
        fileName: widget.fileName,
        colorList: widget.colorList,
        onDoneButtonStyle: widget.onDoneButtonStyle,
        onBackPress: widget.onBackPress,
        editorBackgroundColor: widget.editorBackgroundColor,
        galleryThumbnailQuality: widget.galleryThumbnailQuality,
        centerText: widget.centerText,
        mediaPath: widget.mediaPath,
      ),
    );
  }
}
