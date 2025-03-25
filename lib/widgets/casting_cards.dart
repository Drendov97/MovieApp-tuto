import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movieapp/providers/movies_providers.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class CastingCards extends StatelessWidget {

  final int movieID;
  const CastingCards(this.movieID);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieID),
     
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {

        if(!snapshot.hasData){
          return Container(
            height: 180,
            child: CupertinoActivityIndicator(),
            );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
                margin: EdgeInsets.only(bottom:30),
                width: double.infinity,
                height: 180,
      
                child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>_CastCard(cast[index]),
                ),
              );
      },
    );

    
  }
}

class _CastCard extends StatelessWidget {
 

  final Cast actor;
   const _CastCard(this.actor);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: 100,
      height: 100,
      
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
               image: NetworkImage('https://www.themoviedb.org/t/p/${actor.fullProfilePath}'),
               height: 120,
               width: 100,
               fit: BoxFit.cover,
               ),
          ),

          SizedBox(height: 5),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}