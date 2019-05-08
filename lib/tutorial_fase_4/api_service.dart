import 'dart:convert';

import 'package:flutter_tutorial/models.dart';
import 'package:http/http.dart' as http;

class APIService {
  static String baseUrl = "https://www.thesportsdb.com/";
  static String leagueId = "4328";
  static String apiSuffix = "api/v1/json/1/";

  static Future<List<Team>> getListTeam() async {
    var url = baseUrl + apiSuffix + "lookup_all_teams.php?id=$leagueId";

    http.Response response = await http.get(url);
    final int statusCode = response.statusCode;
    final String jsonBody = response.body;

    print(statusCode);

    if (statusCode < 200 || statusCode > 400 || jsonBody == null) {
      throw new Exception("Error while fetching data");
    }

    print("asdasd");

    print(jsonBody);

    final List container = json.decode(jsonBody)["teams"];

    return container.map((dataRaw) => new Team.fromJson(dataRaw)).toList();
  }

  static Future<League> getLeagueDetail() async {
    var url = baseUrl + apiSuffix + "lookupleague.php?id=$leagueId";

    http.Response response = await http.get(url);
    final int statusCode = response.statusCode;
    final String jsonBody = response.body;

    print(statusCode);

    if (statusCode < 200 || statusCode > 400 || jsonBody == null) {
      throw new Exception("Error while fetching data");
    }

    print("asdasd");

    print(jsonBody);

    final List container = json.decode(jsonBody)["leagues"];

    return container[0];
  }
}
