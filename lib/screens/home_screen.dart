import 'package:flutter/material.dart';
import 'package:flutter_movieapp/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const SingleChildScrollView(
        child:  Column(
          children: [
            //Todo: CardSwiper
            CardSwiper(),
            //Todo: Listado Horizontal de peliculas
            MoviesSlider(),
            MoviesSlider(),
            MoviesSlider(),
            MoviesSlider(),
          
          ],
        ),
      )
    );
  }
}

