import 'dart:async';
import 'hero_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final apiProvider = HeroApiProvider();

  Future<ItemModel> fetchHeroes() => apiProvider.fetchSuperHero();
}