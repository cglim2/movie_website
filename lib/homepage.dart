import 'package:flutter/material.dart';
import 'package:movie_website/data/movie_dart.dart';
import 'package:movie_website/model/movie_model.dart';
//import 'package:flutter/rendering.dart';
import 'package:movie_website/skeleton_loading/carousel_skeleton.dart';
import 'package:movie_website/skeleton_loading/now_skeleton.dart';
import 'package:movie_website/skeleton_loading/popular_skeleton.dart';
import 'package:movie_website/wedget/icon_searchbar.dart';
import 'package:movie_website/wedget/main_drawer.dart';
import 'package:movie_website/widget/main_carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> _topRatedMovie = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMovieData();
    });
  }

  void getMovieData() async {
    var data = MovieData();
    _topRatedMovie = await data.fetchTopRatedMovies();
    setState(() {
      isLoading = false;
    });
    //print(_topRatedMovie[0].originalTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconSearchbar(),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                'Top Rated Movies',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: isLoading
                        ? CarouselSkeleton()
                        : MainCarouselSlider(topRatedMovies: _topRatedMovie),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: Text(
                          'Now Playing Movies',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      NowSkeleton(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                'Exploler popular Movies',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (context, Constraints) {
                  double gridviewheight = (Constraints.maxWidth / 5) * 1.3 * 4;
                  return SizedBox(
                    height: gridviewheight,
                    child: PopularSkeletom(),
                  );
                },
              ),
            ),
            // SizedBox(height: 20),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            //   child: Text(
            //     'footer Movies',
            //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
