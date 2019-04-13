import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class HeroesBloc {

  final _repository = Repository();
  final _heroesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allHeroes => _heroesFetcher.stream;

  fetchAllHeroes() async{
    ItemModel itemModel = await _repository.fetchHeroes();
    _heroesFetcher.sink.add(itemModel);
  }

  dispose(){
    _heroesFetcher.close();
  }
}

final bloc = HeroesBloc();