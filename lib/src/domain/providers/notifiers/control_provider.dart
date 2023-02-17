import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/colors.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/font_family.dart';
import 'package:vs_story_designer/src/presentation/utils/constants/gradients.dart';
import 'package:vs_story_designer/vs_story_designer.dart';

class ControlNotifier extends ChangeNotifier {
  String _giphyKey = '';

  /// is required add your giphy API KEY
  String get giphyKey => _giphyKey;
  set giphyKey(String key) {
    _giphyKey = key;
    notifyListeners();
  }

  String get folderName => _folderName;
  set folderName(String key) {
    _folderName = key;
    notifyListeners();
  }

  // theme type
  ThemeType? _themeType;
  ThemeType get themeType => _themeType!;
  set themeType(ThemeType key) {
    _themeType = key;
    notifyListeners();
  }

  String _folderName = "";

  int _gradientIndex = Random().nextInt(50);

  /// current gradient index
  int get gradientIndex => _gradientIndex;

  /// get current gradient index
  set gradientIndex(int index) {
    /// set new current gradient index
    _gradientIndex = index;
    notifyListeners();
  }

  bool _isTextEditing = false;

  /// is text editor open
  bool get isTextEditing => _isTextEditing;

  /// get bool if is text editing
  set isTextEditing(bool val) {
    /// set bool if is text editing
    _isTextEditing = val;
    notifyListeners();
  }

  bool _isPainting = false;

  /// is painter sketcher open
  bool get isPainting => _isPainting;
  set isPainting(bool painting) {
    _isPainting = painting;
    notifyListeners();
  }

  // List<String>? _fontList = fontFamilyList;

  // /// here you can define your own font family list
  // List<String>? get fontList => _fontList;
  // set fontList(List<String>? fonts) {
  //   _fontList = fonts;
  //   notifyListeners();
  // }
  List<FontType>? _fontList = AppFonts.fontFamilyListENUM;

  /// here you can define your own font family list
  List<FontType>? get fontList => _fontList;
  set fontList(List<FontType>? fonts) {
    _fontList = fonts;
    notifyListeners();
  }

  bool _isCustomFontList = false;

  /// if you add your custom list is required to specify your app package
  bool get isCustomFontList => _isCustomFontList;
  set isCustomFontList(bool key) {
    _isCustomFontList = key;
    notifyListeners();
  }

  List<List<Color>>? _gradientColors = gradientBackgroundColors;

  /// here you can define your own background gradients
  List<List<Color>>? get gradientColors => _gradientColors;
  set gradientColors(List<List<Color>>? color) {
    _gradientColors = color;
    notifyListeners();
  }

  Widget? _middleBottomWidget;

  /// you can add a custom widget on the bottom
  Widget? get middleBottomWidget => _middleBottomWidget;
  set middleBottomWidget(Widget? widget) {
    _middleBottomWidget = widget;
    notifyListeners();
  }

  Future<bool>? _exitDialogWidget;

  /// you can create you own exit window
  Future<bool>? get exitDialogWidget => _exitDialogWidget;
  set exitDialogWidget(Future<bool>? widget) {
    _exitDialogWidget = widget;
    notifyListeners();
  }

  List<Color>? _colorList = defaultColors;

  /// you can add your own color palette list
  List<Color>? get colorList => _colorList;
  set colorList(List<Color>? value) {
    _colorList = value;
    notifyListeners();
  }

  /// get image path
  String _mediaPath = '';
  String get mediaPath => _mediaPath;
  set mediaPath(String media) {
    _mediaPath = media;
    notifyListeners();
  }

  bool _isPhotoFilter = false;
  bool get isPhotoFilter => _isPhotoFilter;
  set isPhotoFilter(bool filter) {
    _isPhotoFilter = filter;
    notifyListeners();
  }

  bool _isRenderingWidget = false;
  bool get isRenderingWidget => _isRenderingWidget;
  set isRenderingWidget(bool rendering) {
    _isRenderingWidget = rendering;
    notifyListeners();
  }

  ///////
  bool _enableTextShadow = true;
  bool get enableTextShadow => _enableTextShadow;
  set enableTextShadow(bool filter) {
    _enableTextShadow = filter;
    notifyListeners();
  }

  ////
}
