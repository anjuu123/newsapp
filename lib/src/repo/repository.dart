import 'package:news_app/src/models/item_model.dart';
import 'package:news_app/src/repo/api_provider.dart';
import 'package:news_app/src/repo/db_provider.dart';

class Repository{
  final dbProvider = DbProvider();
  final apiProvider = ApiProvider();

  fetchTopIds()async{
return await apiProvider.fetchTopIds();
  }

  fetchItem(int id) async{
    ItemModel item = await dbProvider.fetchItem(id);
    if(item !=null){
      return item;
    }
    item = await apiProvider.fetchItem(id);
    if(item !=null){
      dbProvider.insertItem(item);
    }
    return item;

  }
}