import 'dart:convert';
import 'package:http/http.dart';

class ApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final response = await client
        .get("https://hacker-news.firebaseio.com/v0/topstories.json");
    final ids = jsonDecode(response.body);
    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get(
        "https://hacker-news.firebaseio.com/v0/item/$id.json");
  }
}
