import 'package:flutter/material.dart';
import 'package:flutter_movieapp/models/models.dart';
import 'package:flutter_movieapp/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  TODO: cambiar por instancia de movie
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _OverView(movie),
              _OverView(movie),
              
              
              CastingCards(movie.id)
            ])
          )
        ],
      )
      );
    
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar(this.movie);


  @override
  Widget build(BuildContext context) {
    //final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom:10, left: 10, right:10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
            selectionColor: Color.fromARGB(0, 196, 202, 202),
            
            
            ),
          ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://www.themoviedb.org/t/p/${movie.fullBackdropPath }'),
          fit: BoxFit.cover,
          ),
      ),
      );
  }
}

class _PosterAndTitle extends StatelessWidget {
  

  final Movie movie;

  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    final TextTheme textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              
              child:  FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                 image: NetworkImage('https://www.themoviedb.org/t/p/${movie.fullPosterImg}'),
                 height: 150,
                 width: 110,
                 
            
                 ),
            ),
          ),
          SizedBox(width: 20),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textTheme.headlineMedium, overflow: TextOverflow.ellipsis, maxLines: 2),
            
                //Text(movie.title, style: textTheme.headlineMedium, overflow: TextOverflow.ellipsis, maxLines: 2),
                Text(movie.originalTitle, style: textTheme.headlineSmall, overflow: TextOverflow.ellipsis, maxLines: 2),
            
                Row(
                  children: [
                    Icon(Icons.star_outline, size: 20, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(movie.voteAverage.toString(), style: textTheme.bodySmall)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  
  final Movie movie;

  const _OverView(this.movie);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical:10),
      child: Text(movie.overview,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
      )
    );
  }
}