import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Pokemon {
  String name;
  String url;

  Pokemon({this.name = "", this.url = ""});
}
