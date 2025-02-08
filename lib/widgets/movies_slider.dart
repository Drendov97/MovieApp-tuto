import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) => _MoviePoster()
              ),
            ),
          
        ],
      )
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

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
                              child: const FadeInImage(
                                placeholder: AssetImage('assets/no-image.jpg'),
                                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcPIWPuk-G3s-umWaTiMjmtWv-wsxQjftaBw&s'),
                                 width: 130,
                                 height: 190,
                                 fit: BoxFit.cover
                                 ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),

                           const Text('El señor de los Anillos: El retorno del Rey',
                            maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.center,
                             )
                      ],


                    ),


                  );
  }
}