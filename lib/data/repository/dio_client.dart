import 'package:dio/dio.dart';

class DioClient{

  Dio dio = Dio();

  final String baseUrl='https://pokeapi.co/api/v2/pokemon/ditto';

  final String charUrl='https://pokeapi.co/api/v2/pokemon?limit=200&offset=200';
  

}

