import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:30),
      width: double.infinity,
      height: 180,
      
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>_CastCard()
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: 100,
      height: 100,
      
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
               image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcPIWPuk-G3s-umWaTiMjmtWv-wsxQjftaBw&s'),
               height: 140,
               width: 100,
               fit: BoxFit.cover,
               ),
          ),

          SizedBox(height: 5),
          Text(
            'william Defoe',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}