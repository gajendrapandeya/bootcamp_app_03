import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:truth_and_dare/model/player.dart';

class PrefService {
  static const String _playersKey = 'players';

  static Future<bool> savePlayers(List<Player> players) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonString = players.map((player) => jsonEncode(player.toJson())).toList();
    return prefs.setStringList(_playersKey, jsonString);
  }

  static Future<List<Player>> getPlayers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonString = prefs.getStringList(_playersKey);
    if (jsonString != null) {
      return jsonString.map((playerStr) => Player.fromJson(jsonDecode(playerStr))).toList();
    } else {
      return [];
    }
  }
}
