import 'dart:convert';

import 'package:http/http.dart' as http;
import '../config/config.dart';
import 'weather.dart';
class WeatherApi {
  final String uri = config['apiUrl'];
  final String key = config['apiKey'];
  final String path = config['path'];
  Future<Weather> getTime(String location) async {
    Map<String , dynamic> params = {
      'q' : location,
      'appId' : key
    };
    Uri link = Uri.https(uri, path , params);
    http.Response result = await http.get(link);
    Map<String , dynamic> data = json.decode(result.body);
    Weather w = Weather.convert(data);
    return w;
  }


}