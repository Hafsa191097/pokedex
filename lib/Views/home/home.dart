import 'dart:developer';

import 'package:Pokedex/cubit/authentication/authentication_cubit.dart';
import 'package:Pokedex/cubit/pokemondata/pokemondata_cubit.dart';
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
    context.read<PokemondataCubit>().getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if(state is AuthenticationInitial){
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'PokeDex',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          elevation: 0,
        ),
        body: BlocBuilder<PokemondataCubit, PokemondataState>(
          builder: (context, state) {
            log(state.toString());

            if (state is PokemondataLoading) {
              return const Center(child:  CircularProgressIndicator());
            } else if (state is PokemondataLoaded) {
              return const HomeUI();
            } else if (state is PokemondataError) {
              return const Center(child: Text("Error"));
            } else {
              return const Center(child: Text("Initial"));
            }
          },
        ),
      ),
    );
  }
}

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        const Center(child: Text("helouuw")),
        Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<AuthenticationCubit>().logoutUser();
            },
            child: const Text(
              "Logout",
            ),
          ),
        ),
      ],
    );
  }
}
