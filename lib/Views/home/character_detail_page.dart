
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../../widgets/pokemon_features.dart';
import '../../Blocs/details_bloc/details_bloc.dart';


class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({
    required this.name,
    required this.pokemon,
    required this.url,
    Key? key}) : super(key: key);

  final String pokemon;
  final String name;
  final String url;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {


  @override
  void initState() {
    BlocProvider.of<DetailsBloc>(context).add(GetDetailsEvent(widget.url));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: red,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: red,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
        body: PokemonFeatures(widget: widget),
    );
  }
}


