import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_movieapp/models/models.dart';
//import 'package:flutter_card_swiper/flutter_card_swiper.dart';
class CardSwiper extends StatelessWidget {
  

  

  final List<Movie> movies;

  const CardSwiper({
    Key? key,
    required this.movies
  }): super(key:key);

  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;

if(this.movies.length == 0){
  return Container(
    width: double.infinity,
    height: size.height * 0.5,
    child: Center(child: CircularProgressIndicator()),
  );
 } else {
}

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      
    
      child: Swiper(
        itemCount:movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index){
          final movie=movies[index];
          movie.heroId = 'swiper-${movie.id}';
          
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments:movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('https://www.themoviedb.org/t/p/${movie.fullPosterImg}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}