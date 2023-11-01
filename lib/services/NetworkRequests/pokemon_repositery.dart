import 'dart:convert';

import 'package:Pokedex/Constants/constants.dart';
import 'package:Pokedex/services/page_response.dart';
import 'package:http/http.dart' as http;

class PokedexRepository{
  final client = http.Client();
  Future<PokemonPageResponse> getpokemon(int pageindex) async{
    final query_parameters ={
      'limit' : '200',
      'offset' : (pageindex * 200).toString()
    };
    final uri = Uri.https(baseUrl,'/api/v2/pokemon',query_parameters);
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonPageResponse.fromJson(json);
  }
}