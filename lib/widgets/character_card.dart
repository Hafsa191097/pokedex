
import 'dart:developer';

import 'package:Pokedex/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../constants/app_images.dart';

// // ignore: must_be_immutable
// class CharacterCard extends StatelessWidget {
//   CharacterCard(
//       this.state,
//       this.index,
//       {Key? key,
//       }) : super(key: key);

//   dynamic state;
//   int index;


//   @override
//   Widget build(BuildContext context) {
//     return GridTile(
//       child: Padding(
//         padding:const EdgeInsets.all(4),
//         child: Card(
//         shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),),
//           elevation: 8,
//           child: Stack(
//             children: [
//               Center(
//                 child: Column(
//                   children: [
//                     Image.asset('${images[state.pokemonList[index].name]}',height:135),
//                     Text('${state.pokemonList[index].name}',
//                       style:const TextStyle(fontSize: 20,color:red))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// ignore: must_be_immutable
class CharacterCard extends StatelessWidget {
   CharacterCard(this.state,
      this.index,
      {Key? key,
      }) : super(key: key);
  dynamic state;
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  child: Image.asset(
                    '${images[state.pokemonList[index].name]}',height:135,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(Icons.favorite_rounded,color: red,),
                          onPressed: () {
                            log('toggled');
                          },
                        ),
                      )),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '${state.pokemonList[index].name}',
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            
            
          ],
        ),
      ),
    );
  }
}