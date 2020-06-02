import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String worldwideUrl = 'https://disease.sh/v2/all';

  getWorldWideData() async {
    Map worldData;
    http.Response response = await http.get(worldwideUrl);
    if (response.statusCode == 200) {
      worldData = jsonDecode(response.body);
      return worldData;
    } else {
      print(response.statusCode);
    }
  }

  final String countryUrl = 'https://disease.sh/v2/countries?sort=deaths';

  getCountryData(List countryData) async {
    http.Response response = await http.get(countryUrl);
    if (response.statusCode == 200) {
      countryData = json.decode(response.body);
      return countryData;
    } else {
      print(response.statusCode);
    }
  }
}
