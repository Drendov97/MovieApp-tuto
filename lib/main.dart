import 'package:flutter/material.dart';
import 'package:flutter_movieapp/providers/movies_providers.dart';
import 'package:flutter_movieapp/screens/screens.dart';
import 'package:provider/provider.dart';



void main() => runApp( AppState());

class AppState extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: ( _ )=> MoviesProvider(), lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),

      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.red
          )
      ),
      
    );
  }
}