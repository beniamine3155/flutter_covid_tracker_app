import 'dart:convert';

import 'package:flutter_covid_tracker_app/model/world_state_model.dart';
import 'package:flutter_covid_tracker_app/services/utilitis/url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStateModel> fetchWorldStateRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> fetchCountriesList() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('error');
    }
  }
}
