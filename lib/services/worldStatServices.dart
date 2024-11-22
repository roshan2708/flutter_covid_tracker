import 'dart:convert';

import 'package:covidtracker/model/worldStatsModel.dart';
import 'package:covidtracker/services/url.dart';
import 'package:http/http.dart' as http;

class StatsSetvices {
  Future<WorldStats> fetchWorldStatsServices() async{
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));
    
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStats.fromJson(data);
    }
    else {
      throw Exception("Error occured");
    }
  }

  Future<List<dynamic>> fetchCountryList() async{
    var data;
    final response = await http.get(Uri.parse(AppUrl.countryListApi));
    
    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      return data;
    }
    else {
      throw Exception("Error occured");
    }
  }
}