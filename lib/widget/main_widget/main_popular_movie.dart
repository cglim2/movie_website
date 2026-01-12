import 'package:flutter/material.dart';
import 'package:movie_website/model/movie_model.dart';
//import 'package:flutter/src/gestures/events.dart';

class MovieGridView extends StatefulWidget {
  final List<MovieModel> popularMovies;
  const MovieGridView({super.key, required this.popularMovies});

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  int? hoverindex;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.popularMovies.length,
      itemBuilder: (BuildContext context, int index) {
        //final MovieModel movie = widget.popularMovies[index];
        final MovieModel movie = widget.popularMovies[index];
        return MouseRegion(
          //   onEnter: (PointerCancelEvent event) {},
          //   onExit: (PointerCancelEvent event) {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: hoverindex == index
                ? (Matrix4.identity()
                    ..scale(1.05, 1.05)
                    ..translate(0, -10))
                : Matrix4.identity(),
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  elevation: hoverindex == index ? 20 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.all(8.0),
                          children: [
                            Text(
                              movie.title,
                              style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 4),
                                Text(
                                  movie.voteAverage.toString(),
                                  style: TextStyle(color: Colors.white70),
                                ),
                                SizedBox(width: 4),
                                Row(
                                  children: [
                                    Text(
                                      'Language: ${movie.originalLanguage}',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Audit: ${movie.adult ? "Yes " : "no"}',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
