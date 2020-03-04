import 'dart:convert';
import 'package:news_app/repo/core/constants.dart';
import 'package:http/http.dart';
import 'package:news_app/src/models/item_model.dart';
import 'package:news_app/src/repo/sources.dart';

class ApiProvider extends Sources {
  Client client = Client();

  fetchTopIds() async {
    final response = await client
        .get("$BASE_URL/topstories.json");
    final ids = jsonDecode(response.body);
    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get(
        "$BASE_URL/item/$id.json");
        final parsedJson = jsonDecode(response.body);
        return ItemModel.fromJson(parsedJson);
  }

  @override
  Future<int> insertItem(ItemModel item) {
    return null;
  }

}
