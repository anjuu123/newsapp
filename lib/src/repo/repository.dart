import 'package:news_app/src/models/item_model.dart';
import 'package:news_app/src/repo/api_provider.dart';
import 'package:news_app/src/repo/db_provider.dart';
import 'package:news_app/src/repo/sources.dart';

class Repository{

List<Sources> sources = [
DbProvider(),
ApiProvider(),
];

  fetchTopIds()async{
return await sources[1].fetchTopIds();
  }

  fetchItem(int id) async{
    ItemModel item;
var source;

    for(source in sources){
      item = await source.fetchItem(id);
      if(item != null){
        break;
      }
    }

    for(var origin in sources){
      if(source != origin){
      origin.insertItem(item);
    }
    }
    return item;

  }
}