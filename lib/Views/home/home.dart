import 'dart:developer';
import 'package:Pokedex/Bloc/bloc/pokedex_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/authentication/authentication_cubit.dart';

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
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: BlocBuilder<PokedexBloc, PokedexState>(builder: (context, state) {
        log(state.toString());

        if (state is PokedexLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PokedexLoadingSuccess) {
          return const HomeUI();
        } else if (state is PokedexLoadingError) {
          return Center(child: Text(state.error.toString()));
        } else {
          return const Initiall();
        }
      }),
    );
  }
}

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokedexBloc, PokedexState>(
        builder: (context, state) {
          return Column(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: state.pokedexlist.length,
                itemBuilder: (context, index) {
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
              ),
            ],
          );
        },
      );
  }
}

class Initiall extends StatelessWidget {
  const Initiall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              if(state is AuthenticationSuccess){
                Navigator.of(context).pushReplacementNamed('/login');
              }
            },
            child: MaterialButton(
              onPressed: () {
                try {
                  BlocProvider.of<AuthenticationCubit>(context).logoutUser();
                  
                } catch (e) {
                  log(e.toString());
                }
              },
              child: const Text('logout'),
            ),
          ),
          const Text('initial'),
        ],
      ),
    );
  }
}
