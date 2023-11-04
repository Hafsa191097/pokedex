class PokemonList{
  final int id;
  final String name;
  

  String get imageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  PokemonList({required this.id, required this.name});
  factory PokemonList.fromJson(Map<String,dynamic> json){
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);
    return PokemonList(id: id, name: name);
  }

}

class PokemonPageResponse{
  final List<PokemonList> pokemonlistings;
  final bool canloadnext;

  PokemonPageResponse({required this.pokemonlistings, required this.canloadnext});
  factory PokemonPageResponse.fromJson(Map<String,dynamic> json){
    final canloadnext = json['next'] != null;
    final pokemonlistings = (json['results'] as List).map((jsonlisting)=> PokemonList.fromJson(jsonlisting)).toList();
    
    return PokemonPageResponse(pokemonlistings: pokemonlistings, canloadnext: canloadnext);
  }
}