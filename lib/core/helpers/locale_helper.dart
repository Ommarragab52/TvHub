import 'package:movies/core/extensions/extension_functions.dart';
import 'package:movies/core/services/service_locator.dart';

getCountryNameByCode(String code) {
  switch (code.toLowerCase()) {
    case 'us':
      return SL.context.loc.usa;
    case 'eg':
      return SL.context.loc.egypt;
  }
}

getLanguageNameByCode(String code) {
  switch (code) {
    case 'ar-EG':
      return SL.context.loc.arabic;
    case 'en-US':
      return SL.context.loc.english;
  }
}
