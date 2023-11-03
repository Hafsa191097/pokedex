class Results {
  final String name;
  final int id;
  String? url;

  Results({required this.id, required this.name});
  String get imageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  
  factory Results.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'];
    final id = int.parse(url.split('/')[6]);
    return Results(id: id, name: name);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}