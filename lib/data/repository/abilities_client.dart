import 'dart:developer';

import 'package:Pokedex/Models/pokemon.dart';
import 'package:dio/dio.dart';

import 'dio_client.dart';


class AbilitiesClient extends DioClient{

  Future<Iterable<Abilities>> getAbilities(String url)async{
    Iterable<Abilities> abilities;

    final Response response=await dio.get(url);
    List ability=response.data['abilities'];
    abilities=ability.map<Abilities>((e){
      return Abilities.fromJson(e);
    }).toList();
    for(var data in abilities){
      log((data.ability!.name).toString());
    }
    return abilities;
  }

}