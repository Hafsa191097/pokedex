
import 'package:Pokedex/data/repository/dio_client.dart';
import 'package:dio/dio.dart';


class FeaturesClient extends DioClient{


  Future<List<int>> getFeatures(String url) async{

    final Response response=await dio.get(url);
    int weight=response.data['weight'];
    int height=response.data['height'];
    return [weight,height];


  }
}