import 'package:flutter/material.dart';
import 'package:flutter_movieapp/providers/movies_providers.dart';
import 'package:flutter_movieapp/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);
    // print(moviesProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies in Theaters'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {
              // Navigate to search screen
            },
          ),
        ],
        ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            //Todo: CardSwiper
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //Todo: Listado Horizontal de peliculas
             MoviesSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares!!'
            ),
            // const MoviesSlider(),
            // const MoviesSlider(),
            // const MoviesSlider(),
          
          ],
        ),
      )
    );
  }
}

