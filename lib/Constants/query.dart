import 'package:wskart/Constants/app.dart';

///
/// Remove empty string in query string and default language is not unnecessary
///
Map<String, dynamic> preQueryParameters(Map<String, dynamic> qs) {
  Map<String, dynamic> params = Map<String, dynamic>.of(qs);
  params.removeWhere((key, value) => value == null || value == "");
  params.removeWhere((key, value) => key == 'lang' && value == defaultLanguage);
  print('Value Of Param: $params');
  return params;
}
