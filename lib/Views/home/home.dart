import 'dart:developer';
import 'dart:ffi';
import 'package:Pokedex/Views/home/Likes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:Pokedex/Blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import '../../cubit/auth_bloc/authentication_cubit.dart';
import '../../Models/character_card.dart';
import '../../Models/page_response.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<PokemonBloc>(context).add(GetPokemonNameEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PokeDex',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600, ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  LikesPage(),
              ),
            );
          }, icon: const Icon(Icons.favorite)),
          BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, statee) {
              if (statee is AuthenticationInitial) {
                Navigator.of(context).pushReplacementNamed('/login');
              }
            },
            child: IconButton(
              onPressed: () {
                try {
                  BlocProvider.of<AuthenticationCubit>(context).logoutUser();
                } catch (e) {
                  log(e.toString());
                }
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is GetPokemonNameState) {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            shrinkWrap: true,
            itemCount: state.pokemonList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    
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
                  child: CharacterCard(state, index));
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}

