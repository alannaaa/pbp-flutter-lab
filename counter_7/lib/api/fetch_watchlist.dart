import 'package:counter_7/model/watchlist_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Watchlist>> fetchWatchlist() async {
  var url = Uri.parse('https://pbp-tugas2-alanna.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
  url,
  headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
  },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<Watchlist> watchlist = [];
  for (var d in data) {
    if (d != null) {
        watchlist.add(Watchlist.fromJson(d));
    }
  }

  return watchlist;
}