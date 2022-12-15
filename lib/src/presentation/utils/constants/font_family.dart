import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:vs_story_designer/src/presentation/utils/constants/app_enums.dart';
import 'package:vs_story_designer/vs_story_designer.dart';

class AppFonts {
  // static const fontFamilyList = [
  //   'Alegreya',
  //   'B612',
  //   'TitilliumWeb',
  //   'Varela',
  //   'Vollkorn',
  //   'Rakkas',
  //   'ConcertOne',
  //   'YatraOne',
  //   'OldStandardTT',
  //   'Neonderthaw',
  //   'DancingScript',
  //   'SedgwickAve',
  //   'IndieFlower',
  //   'Sacramento',
  //   'PressStart2P',
  //   'FrederickatheGreat',
  //   'ReenieBeanie',
  //   'BungeeShade',
  //   'UnifrakturMaguntia'
  // ];

  static const fontFamilyListENUM = [
    FontType.openSans,
    FontType.baskerville,
    FontType.cormorant,
    FontType.sourceSerifPro,
    FontType.kurale,
    FontType.dancingScript,
    FontType.amatic,
    FontType.architect,
    FontType.sahitya,
    FontType.garamond,
    FontType.chewy,
    FontType.comfortaa,
    FontType.reenie,
    FontType.satisfy,
    FontType.alfaSlab,
    FontType.josefinSans,
    FontType.kaushanScript,
    FontType.marckScript,
    FontType.volkhov,
    FontType.permanent,
    FontType.playfair,
    FontType.specialElite,
    FontType.courierPrime,
    FontType.roboto,
    FontType.karma,
    FontType.rougeScript,
    FontType.rubik,
    FontType.siliguri,
    FontType.meeraInimai,
    FontType.slabo27px,
    FontType.poiret,
    FontType.reemKufi,
    FontType.barlow,
    FontType.comicNeue,
    FontType.typewriter,
    FontType.abrilFatface,
    FontType.bebasneue,
    FontType.inknutAntiqua,
    FontType.lobster,
    FontType.khand,
    FontType.alegreya,
    FontType.montserrat,
    FontType.oswald,
    FontType.poppins,
    FontType.lato
  ];

  static TextTheme getTextThemeENUM(FontType val) {
    switch (val) {
      case FontType.oswald:
        return GoogleFonts.oswaldTextTheme();

      case FontType.poppins:
        return GoogleFonts.poppinsTextTheme();

      case FontType.lato:
        return GoogleFonts.latoTextTheme();

      case FontType.montserrat:
        return GoogleFonts.montserratTextTheme();

      case FontType.alegreya:
        return GoogleFonts.alegreyaTextTheme();

      case FontType.khand:
        return GoogleFonts.khandTextTheme();

      case FontType.baskerville:
        return GoogleFonts.baskervvilleTextTheme();

      case FontType.openSans:
        return GoogleFonts.openSansTextTheme();

      case FontType.cormorant:
        return GoogleFonts.cormorantTextTheme();

      case FontType.sourceSerifPro:
        return GoogleFonts.sourceSerifProTextTheme();

      case FontType.kurale:
        return GoogleFonts.kuraleTextTheme();

      case FontType.dancingScript:
        return GoogleFonts.dancingScriptTextTheme();

      case FontType.amatic:
        return GoogleFonts.amaticScTextTheme();

      case FontType.architect:
        return GoogleFonts.architectsDaughterTextTheme();

      case FontType.sahitya:
        return GoogleFonts.sahityaTextTheme();

      case FontType.garamond:
        return GoogleFonts.ebGaramondTextTheme();

      case FontType.chewy:
        return GoogleFonts.chewyTextTheme();

      case FontType.comfortaa:
        return GoogleFonts.comfortaaTextTheme();

      case FontType.reenie:
        return GoogleFonts.reenieBeanieTextTheme();

      case FontType.satisfy:
        return GoogleFonts.satisfyTextTheme();

      case FontType.alfaSlab:
        return GoogleFonts.alfaSlabOneTextTheme();

      case FontType.josefinSans:
        return GoogleFonts.josefinSansTextTheme();

      case FontType.kaushanScript:
        return GoogleFonts.kaushanScriptTextTheme();

      case FontType.marckScript:
        return GoogleFonts.marckScriptTextTheme();

      case FontType.volkhov:
        return GoogleFonts.volkhovTextTheme();

      case FontType.permanent:
        return GoogleFonts.permanentMarkerTextTheme();

      case FontType.playfair:
        return GoogleFonts.playfairDisplayTextTheme();

      case FontType.specialElite:
        return GoogleFonts.specialEliteTextTheme();

      case FontType.courierPrime:
        return GoogleFonts.courierPrimeTextTheme();

      case FontType.roboto:
        return GoogleFonts.robotoTextTheme();

      case FontType.karma:
        return GoogleFonts.karmaTextTheme();

      case FontType.rougeScript:
        return GoogleFonts.rougeScriptTextTheme();

      case FontType.rubik:
        return GoogleFonts.rubikTextTheme();

      case FontType.siliguri:
        return GoogleFonts.hindSiliguriTextTheme();

      case FontType.meeraInimai:
        return GoogleFonts.meeraInimaiTextTheme();

      case FontType.slabo27px:
        return GoogleFonts.slabo27pxTextTheme();

      case FontType.poiret:
        return GoogleFonts.poiretOneTextTheme();

      case FontType.reemKufi:
        return GoogleFonts.reemKufiTextTheme();

      case FontType.barlow:
        return GoogleFonts.barlowCondensedTextTheme();

      case FontType.comicNeue:
        return GoogleFonts.comicNeueTextTheme();

      case FontType.abrilFatface:
        return GoogleFonts.abrilFatfaceTextTheme();

      case FontType.bebasneue:
        return GoogleFonts.bebasNeueTextTheme();

      case FontType.inknutAntiqua:
        return GoogleFonts.inknutAntiquaTextTheme();

      case FontType.lobster:
        return GoogleFonts.lobsterTextTheme();

      default:
        return GoogleFonts.openSansTextTheme();
    }
  }

  static const fontFamilyList = [
    "Open Sans",
    "Baskerville",
    "Cormorant",
    "Source Serif Pro",
    "Kurale",
    "Dancing Script",
    "Amatic",
    "Architect",
    "Sahitya",
    "Garamond",
    "Chewy",
    "Comfortaa",
    "Reenie",
    "Satisfy",
    "Alfa Slab",
    "Josefin Sans",
    "Kaushan Script",
    "Marck Script",
    "Volkhov",
    "Permanent",
    "Playfair",
    "Special Elite",
    "Courier Prime",
    "Roboto",
    "Karma",
    "Rouge Script",
    "Rubik",
    "Siliguri",
    "Meera Inimai",
    "Slabo 27px",
    "Poiret",
    "ReemKufi",
    "Barlow",
    "Comic Neue",
    "Typewriter",
    "Abril Fatface",
    "BEBAS NEUE",
    "Inknut Antiqua",
    "Lobster",
    "Khand",
    "Alegreya",
    "Montserrat",
    "Oswald",
    "Poppins",
    "Lato"
  ];

  static TextTheme getTextTheme(String val) {
    switch (val) {
      case "Oswald":
        return GoogleFonts.oswaldTextTheme();

      case "Poppins":
        return GoogleFonts.poppinsTextTheme();

      case "Lato":
        return GoogleFonts.latoTextTheme();

      case "Montserrat":
        return GoogleFonts.montserratTextTheme();

      case "Alegreya":
        return GoogleFonts.alegreyaTextTheme();

      case "Khand":
        return GoogleFonts.khandTextTheme();

      case "Baskerville":
        return GoogleFonts.baskervvilleTextTheme();

      case "Open Sans":
        return GoogleFonts.openSansTextTheme();

      case "Cormorant":
        return GoogleFonts.cormorantTextTheme();

      case "Source Serif Pro":
        return GoogleFonts.sourceSerifProTextTheme();

      case "Kurale":
        return GoogleFonts.kuraleTextTheme();

      case "Dancing Script":
        return GoogleFonts.dancingScriptTextTheme();

      case "Amatic":
        return GoogleFonts.amaticScTextTheme();

      case "Architect":
        return GoogleFonts.architectsDaughterTextTheme();

      case "Sahitya":
        return GoogleFonts.sahityaTextTheme();

      case "Garamond":
        return GoogleFonts.ebGaramondTextTheme();

      case "Chewy":
        return GoogleFonts.chewyTextTheme();

      case "Comfortaa":
        return GoogleFonts.comfortaaTextTheme();

      case "Reenie":
        return GoogleFonts.reenieBeanieTextTheme();

      case "Satisfy":
        return GoogleFonts.satisfyTextTheme();

      case "Alfa Slab":
        return GoogleFonts.alfaSlabOneTextTheme();

      case "Josefin Sans":
        return GoogleFonts.josefinSansTextTheme();

      case "Kaushan Script":
        return GoogleFonts.kaushanScriptTextTheme();

      case "Marck Script":
        return GoogleFonts.marckScriptTextTheme();

      case "Volkhov":
        return GoogleFonts.volkhovTextTheme();

      case "Permanent":
        return GoogleFonts.permanentMarkerTextTheme();

      case "Playfair":
        return GoogleFonts.playfairDisplayTextTheme();

      case "Special Elite":
        return GoogleFonts.specialEliteTextTheme();

      case "Courier Prime":
        return GoogleFonts.courierPrimeTextTheme();

      case "Roboto":
        return GoogleFonts.robotoTextTheme();

      case "Karma":
        return GoogleFonts.karmaTextTheme();

      case "Rouge Script":
        return GoogleFonts.rougeScriptTextTheme();

      case "Rubik":
        return GoogleFonts.rubikTextTheme();

      case "Siliguri":
        return GoogleFonts.hindSiliguriTextTheme();

      case "Meera Inimai":
        return GoogleFonts.meeraInimaiTextTheme();

      case "Slabo 27px":
        return GoogleFonts.slabo27pxTextTheme();

      case "Poiret":
        return GoogleFonts.poiretOneTextTheme();

      case "ReemKufi":
        return GoogleFonts.reemKufiTextTheme();

      case "Barlow":
        return GoogleFonts.barlowCondensedTextTheme();

      case "Comic Neue":
        return GoogleFonts.comicNeueTextTheme();

      case "Abril Fatface":
        return GoogleFonts.abrilFatfaceTextTheme();

      case "BEBAS NEUE":
        return GoogleFonts.bebasNeueTextTheme();

      case "Inknut Antiqua":
        return GoogleFonts.inknutAntiquaTextTheme();

      case "Lobster":
        return GoogleFonts.lobsterTextTheme();

      default:
        return GoogleFonts.openSansTextTheme();
    }
  }
}
