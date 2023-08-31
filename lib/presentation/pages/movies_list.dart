import 'package:flutter/material.dart';

import '../../interfaces/i_repository.dart';
import '../../models/movies_model.dart';
import '../../repositories/movie_repository.dart';
import '../../ui_constants.dart';
import '../widgets/movie_list_header.dart';
import '../widgets/movie_list_item.dart';
import '../widgets/plain_text.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({
    super.key,
  });

  static const String routeName = '/moviesList';

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late Future<MoviesModel> futureMovies;
  final IRepository repository = MovieRepository();

  @override
  void initState() {
    futureMovies = repository.getModel() as Future<MoviesModel>;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: UIConstants.backgroundColor,
        body: FutureBuilder<MoviesModel>(
          future: futureMovies,
          builder: (
            BuildContext context,
            AsyncSnapshot<MoviesModel> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: PlainText(
                    text: '${snapshot.error}',
                  ),
                );
              } else {
                final moviesList = (snapshot.data as MoviesModel).movies;
                return Column(
                  children: [
                    const MovieListHeader(),
                    UIConstants.sectionSpace,
                    Expanded(
                      child: ListView.builder(
                        itemCount: moviesList.length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return MovieListItem(
                            moviesList: moviesList,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
