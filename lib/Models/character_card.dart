import 'package:Pokedex/Models/page_response.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../Views/home/Likes.dart';

// ignore: must_be_immutable
class CharacterCard extends StatefulWidget {
  CharacterCard(
    this.state,
    this.index, {
    Key? key,
  }) : super(key: key);
  dynamic state;
  int index;

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('favorites').listenable(),
        builder: (BuildContext context, box, Widget? child) {
          final fav = box.get(widget.index) != null;

          return Container(
            margin: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.network(
                            PokemonList(
                                    id: widget
                                        .state.pokemonList[widget.index].id,
                                    name: widget
                                        .state.pokemonList[widget.index].name)
                                .imageUrl,
                            height: 135,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: fav
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_border),
                              color: fav ? Colors.red : Colors.grey,
                              onPressed: () async {
                                if (fav) {
                                  await box.delete(widget.index);
                                  
                                } else {
                                  await box.put(
                                      widget.index,
                                      widget.state.pokemonList[widget.index]
                                          .name);
                                
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        '${widget.state.pokemonList[widget.index].name}',
                        maxLines: 2,
                        style: const TextStyle(
                            fontFamily: 'avenir', fontWeight: FontWeight.w800),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
