import 'package:news_app/src/models/item_model.dart';

abstract class Sources{
Future<List<int>> fetchTopIds();
Future<ItemModel> fetchItem(int id);
Future<int> insertItem(ItemModel item);
}