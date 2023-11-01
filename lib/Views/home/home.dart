import 'dart:developer';

import 'package:Pokedex/Bloc/bloc/pokedex_bloc.dart';
import 'package:Pokedex/cubit/authentication/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
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
          iconTheme:const IconThemeData(
              color: Colors.white
          ),
          actions: [
            
            IconButton(onPressed: (){
              context.read<AuthenticationCubit>().logoutUser();
            },
            icon: const Icon(Icons.logout))
          ],
          centerTitle: true,
          
          backgroundColor: Colors.redAccent,
          elevation: 0,
        ),
        body: BlocBuilder<PokedexBloc, PokedexState>(
          builder: (context, state) {
            log(state.toString());

            if (state is PokedexLoading) {
              return const Center(child:  CircularProgressIndicator());
            } else if (state is PokedexLoadingSuccess) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: state.pokedexlist.length,
                itemBuilder: (context,index){
                  return Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(state.pokedexlist[index].imageUrl),
                          Text(state.pokedexlist[index].name),
                        ],
                      ),
                    ),
                  );
                },
                
              );
            } else if (state is PokedexLoadingError) {
              return Center(child: Text(state.error.toString()));
            } else {
              return const Center(child: Text("Initial"));
            }
          },
        )
    );
  }
}
