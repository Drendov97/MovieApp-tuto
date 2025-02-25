import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movieapp/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  String  _apiKey = 'd573559c0c55ed095fcfd6ac75056a97';
  String  _baseUrl = 'api.themoviedb.org';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider(){
    //print('MoviesProvider iniciado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async{
    var url =
      Uri.https(_baseUrl, '3/movie/top_rated',{
        'api_key': _apiKey,
        'page': '1'
        });

        final response = await http.get(url);
        //final Map<String,dynamic> decodedData = json.decode(response.body);
        
        final topRatedResponse = TopRatedResponse.fromJson(response.body);
        //print(topRatedResponse.results[0].title);
        onDisplayMovies = topRatedResponse.results;

        notifyListeners();
        
  }
  getPopularMovies() async {
    var url =
      Uri.https(_baseUrl, '3/movie/popular',{
        'api_key': _apiKey,
        'page': '1'
        });

        final response = await http.get(url);
        //final Map<String,dynamic> decodedData = json.decode(response.body);
        
        final popularResponse = PopularResponse.fromJson(response.body);
        //print(topRatedResponse.results[0].title);
        popularMovies = [...popularMovies, ...popularResponse.results];
        print(popularMovies[0]);

        notifyListeners();
  }
}