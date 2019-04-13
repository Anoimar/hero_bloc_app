import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class HeroApiProvider {
  Client client = Client();
  final _apiKey = "test_key";

  Future<ItemModel> fetchSuperHero() async {
    print("fetching");
    final response = await client
        .get("https://superheroapi.com/api/$_apiKey/search/super");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load heroes');
    }
  }
}