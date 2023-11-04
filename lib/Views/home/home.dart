import 'dart:developer';
import 'package:Pokedex/Views/home/Likes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:Pokedex/Blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_bloc/authentication_cubit.dart';
import '../../Models/character_card.dart';
import '../../Models/page_response.dart';
import '../../data/repository/pokemon_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<PokemonBloc>(context).add(GetPokemonNameEvent());
    super.initState();
  }
  PokemonClient pokemonRepository=PokemonClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading:false,
        title: const Text(
          'PokeDex',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        actions: [
          BlocListener<PokemonBloc, PokemonState>(
            listener: (context, statee) {
              if (statee is PokemonLoading) {
                try {
                  Navigator.pushNamed(context, '/likes');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                      action: SnackBarAction(
                        label: 'Error',
                        onPressed: () {
                          log(e.toString());
                        },
                      ),
                    ),
                  );
                }
              }
            },
            child: IconButton(
              onPressed: () {
                try {
                  Navigator.pushNamed(context, '/likes');
                } catch (e) {
                  log(e.toString());
                }
              },
              icon: const Icon(Icons.favorite,size: 20,),
            ),
          ),
          BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, statee) {
              if (statee is AuthenticationLogout) {
                try {
                  Navigator.pushNamed(context, '/login');
                } catch (e) {
                  log(e.toString());
                }
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
              icon: const Icon(Icons.logout,size: 20,),
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
