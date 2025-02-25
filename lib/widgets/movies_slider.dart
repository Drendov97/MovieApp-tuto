import 'package:flutter/material.dart';
import 'package:flutter_movieapp/models/models.dart';

class MoviesSlider extends StatelessWidget {
  //const MoviesSlider({super.key});

final List<Movie> movies;
final String? title;

  const MoviesSlider({
    super.key,
    required this.movies,
     this.title});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          if(title != null) 
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) => _MoviePoster(movies[index])
              ),
            ),
          
        ],
      )
    );
  }
}

class _MoviePoster extends StatelessWidget {
  //const _MoviePoster({super.key});



  final Movie movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: 130,
                    height: 190,
                    
                    margin: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                    child:  Column(
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, 'details', arguments:'movie'),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:  FadeInImage(
                                placeholder: const AssetImage('assets/no-image.jpg'),
                                 image: NetworkImage('https://www.themoviedb.org/t/p/${movie.fullPosterImg}'),
                                 width: 130,
                                 height: 190,
                                 fit: BoxFit.cover
                                 ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),

                            Text(movie.title,
                            maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.center,
                             )
                      ],


                    ),


                  );
  }
}