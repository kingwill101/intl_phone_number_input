import 'package:flutter/widgets.dart';
import 'package:intl_phone_number_input/src/models/country_list.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';

import '../models/country_list.dart';

const String PropertyName = 'alpha_2_code';

/// [CountryProvider] provides helper classes that involves manipulations.
/// of Countries from [Countries.countryList]
class CountryProvider {
  /// Get data of Countries.
  ///
  /// Returns List of [Country].
  ///
  ///  * If [countries] is `null` or empty it returns a list of all [Countries.countryList].
  ///  * If [countries] is not empty it returns a filtered list containing
  ///    counties as specified.
  static Future<List<Country>> getCountriesData({@required List<String> countries}) async {
    await Countries.init();
    List jsonList = Countries.countryList;

    if (countries == null || countries.isEmpty) {
      return jsonList.map((country) => Country.fromJson(country)).toList();
    }
    List filteredList = jsonList.where((country) {
      return countries.contains(country[PropertyName]);
    }).toList();

    return filteredList.map((country) => Country.fromJson(country)).toList();
  }
}
