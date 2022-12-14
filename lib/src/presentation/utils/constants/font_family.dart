import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
