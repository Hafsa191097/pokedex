
import 'package:Pokedex/Blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:Pokedex/Models/character_card.dart';
import 'package:Pokedex/Models/page_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/adapters.dart';


// ignore: must_be_immutable
class LikesPage extends StatefulWidget {
  const LikesPage({super.key});
  @override
  State<LikesPage> createState() => _LikesPageState();
  
}

class _LikesPageState extends State<LikesPage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Likes Page',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600, ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('favorites').listenable(),
        builder: (BuildContext context, box, child) { 
          
          
          return BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
          if (state is GetPokemonNameState) {
            
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              shrinkWrap: true,
              itemCount: box.length+200,
              itemBuilder: (context, index) {
                final fav = box.get(index) != null;
                return fav ? GestureDetector(
                    onTap: () async{
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(PokemonList(
                          id: state.pokemonList[index].id,
                          name: state.pokemonList[index].name)
                      .imageUrl),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      
                    },
                    child: CharacterCard(state, index)) : Container();
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
         },
        
      ),
    );
  }
}