
import 'package:Pokedex/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../Blocs/details_bloc/details_bloc.dart';
class FeaturesCard extends StatefulWidget {
  const FeaturesCard({
    required this.name,
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final String name;
  final String pokemon;

  @override
  State<FeaturesCard> createState() => _FeaturesCardState();
}

class _FeaturesCardState extends State<FeaturesCard> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:450 ,
      width: ScreenUtil().screenWidth,
      decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(28),
              topLeft: Radius.circular(28))),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16 ),
              child: Text(widget.name, textAlign: TextAlign.center,

                  style: const TextStyle(fontSize: 25, color: red,fontWeight: FontWeight.w700)),
            ),
          ), 
        Expanded(
          flex:4,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40 ,
              child: BlocBuilder<DetailsBloc, DetailsState>(
                builder: (context, state) {
                  if (state is CharacterFeaturesState) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.abilities.length,
                        itemBuilder: (context, index) {
                          var data = state.abilities.toList();
                          return Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                                width: 150,
                                decoration: const BoxDecoration(
                                  color: gray,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                child: Center(
                                    child: Text(
                                        data[index].ability!.name.toString(),
                                        style: const TextStyle(fontSize: 23,fontWeight: FontWeight.w600,color: Colors.white),
                                        textAlign: TextAlign.center))),
                          );
                        }
                    );
                  }
                  return const Center(
                      child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(
              height: 40 ,
              child: BlocBuilder<DetailsBloc, DetailsState>(
                builder: (context, state) {
                  if (state is CharacterFeaturesState) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.types.length,
                        itemBuilder: (context, index) {
                          var data = state.types.toList();
                          return Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: blueShade100,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                child: Center(
                                    child: Text(
                                        data[index].type!.name.toString(),
                                        style: const TextStyle(fontSize: 23,fontWeight: FontWeight.w600,color: Colors.white),
                                        textAlign: TextAlign.center))),
                          );
                        }
                    );
                  }
                  return const Center(
                      child: CircularProgressIndicator());
                },
              ),
            ), 
            const SizedBox(height: 15,),
            BlocBuilder<DetailsBloc, DetailsState>(
              builder: (context, state) {
                if (state is CharacterFeaturesState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Box(state: state,feature: 'Weight',unit:'Kg',index: 0),
                      Box(state: state,feature: 'Height',unit:'M',index: 1)
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            )
          ],
      ),
        )
        ],
      ),
    );
  }
}

