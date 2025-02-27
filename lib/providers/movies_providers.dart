import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movieapp/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  String  _apiKey = 'd573559c0c55ed095fcfd6ac75056a97';
  String  _baseUrl = 'api.themoviedb.org';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider(){
    //print('MoviesProvider iniciado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future <String> _getJsonData(String endpoint, [int page=1]) async{
    var url =
      Uri.https(_baseUrl, endpoint,{
        'api_key': _apiKey,
        'page': '$page'
        });
        final response = await http.get(url);
        return response.body;
  }

  getOnDisplayMovies() async{
   
        
        final jsonData = await _getJsonData('3/movie/top_rated');
        final topRatedResponse = TopRatedResponse.fromJson(jsonData);
        //print(topRatedResponse.results[0].title);
        onDisplayMovies = topRatedResponse.results;

        notifyListeners();
        
  }
  getPopularMovies() async {
    
   _popularPage++;

        final jsonData = await _getJsonData('3/movie/popular',_popularPage);

        //final Map<String,dynamic> decodedData = json.decode(response.body);
        
        final popularResponse = PopularResponse.fromJson(jsonData);
        //print(topRatedResponse.results[0].title);
        popularMovies = [...popularMovies, ...popularResponse.results];
        //print(popularMovies[0]);

        notifyListeners();
  }
}