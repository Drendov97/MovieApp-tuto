import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
//import 'package:flutter_card_swiper/flutter_card_swiper.dart';
class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;



    return Container(
      width: double.infinity,
      height: size.height * 0.5,
    
      child: Swiper(
        itemCount:10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments:'movie'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcPIWPuk-G3s-umWaTiMjmtWv-wsxQjftaBw&s'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },

      ),
    );
  }
}