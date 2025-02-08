import 'package:flutter/material.dart';
import 'package:flutter_movieapp/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  TODO: cambiar por instancia de movie
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _OverView(),
              _OverView(),
              
              
              CastingCards()
            ])
          )
        ],
      )
      );
    
  }
}

class _CustomAppBar extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.only(bottom:10),
          color: Colors.black12,
          child: Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
            
            ),
          ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcPIWPuk-G3s-umWaTiMjmtWv-wsxQjftaBw&s'),
          fit: BoxFit.cover,
          ),
      ),
      );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
               image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcPIWPuk-G3s-umWaTiMjmtWv-wsxQjftaBw&s'),
               height: 150,
               

               ),
          ),
          SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('movie.title', style: textTheme.headlineMedium, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text('movie.originalTitle', style: textTheme.headlineSmall, overflow: TextOverflow.ellipsis, maxLines: 2),

              Row(
                children: [
                  Icon(Icons.star_outline, size: 20, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('movie.voteAverage', style: textTheme.bodySmall)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical:10),
      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum tellus vestibulum nibh accumsan, eget pharetra est lobortis. Morbi maximus placerat nunc, a ultrices orci rutrum eu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse potenti. Sed elementum commodo arcu, in aliquam neque commodo quis. Maecenas ac dapibus arcu. Ut feugiat vel ',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
      )
    );
  }
}