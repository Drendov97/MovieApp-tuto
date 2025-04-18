import 'package:flutter/material.dart';
import 'package:flutter_movieapp/models/models.dart';

class MoviesSlider extends StatefulWidget {
  //const MoviesSlider({super.key});

final List<Movie> movies;
final String? title;
final onNextPage;

  const MoviesSlider({
    super.key,
    required this.movies,
     this.title, required this.onNextPage});

  @override
  State<MoviesSlider> createState() => _MoviesSliderState();
}

class _MoviesSliderState extends State<MoviesSlider> {

  final ScrollController scrollController =  new ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.pixels>=scrollController.position.maxScrollExtent-500){
        widget.onNextPage();
      }
      
    });
  }

  @override
  void dispose() {
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          if(widget.title != null) 
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (BuildContext context, int index) => _MoviePoster(widget.movies[index], '${widget.title}-${index}-${widget.movies[index].id}')
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
  final String heroId;

  const _MoviePoster(this.movie, this.heroId);

  @override
  Widget build(BuildContext context) {

    movie.heroId = heroId;

    return Container(
                    width: 130,
                    height: 190,
                    
                    margin: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                    child:  Column(
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
                            child: Hero(
                              tag: movie.heroId!,
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