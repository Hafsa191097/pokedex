import 'dart:developer';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:Pokedex/Blocs/pokemon_bloc/pokemon_bloc.dart';
import 'package:Pokedex/Views/home/character_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_images.dart';
import '../../cubit/auth_bloc/authentication_cubit.dart';
import '../../widgets/character_card.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'PokeDex',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          elevation: 0,
          actions: [
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
      body: BlocBuilder<PokemonBloc,PokemonState>(
              builder:(context,state){
                if(state is GetPokemonNameState) {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    itemCount:state.pokemonList.length,
                    itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>CharacterDetailPage(
                                name: state.pokemonList[index].name.toString(),
                                pokemon:images[state.pokemonList[index].name]!,
                                url: state.pokemonList[index].url.toString())));
                          },
                            child: CharacterCard(state,index));
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
                }
                return const Center(
                 child: CircularProgressIndicator(),
                 );
               }
      ) ,
    );
  }
}
