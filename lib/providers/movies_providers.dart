import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movieapp/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  String  _apiKey = 'd573559c0c55ed095fcfd6ac75056a97';
  String  _baseUrl = 'api.themoviedb.org';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast ={};

  int _popularPage = 0;

  MoviesProvider(){
    //print('MoviesProvider iniciado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future <String> _getJsonData(String endpoint, [int page=1]) async{
    final url =
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

  Future<List<Cast>> getMovieCast(int movieID) async{
    
    if(moviesCast.containsKey(movieID)) return moviesCast[movieID]!;

    final jsonData = await this._getJsonData('3/movie/$movieID/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieID] = creditsResponse.cast;

    return creditsResponse.cast;

  }

  Future<List<Movie>> searchMovies(String query) async{
    final url =
      Uri.https(_baseUrl, '3/search/movie',{
        'api_key': _apiKey,
        'query': query
        });

        final response = await http.get(url);
        final searchResponse = SearchResponse.fromJson( response.body);

        return searchResponse.results;
  }

  
}