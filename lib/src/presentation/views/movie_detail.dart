import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../../domain/entity/genres_model.dart';
import '../../data/repositories/genre_repository.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/i_repository.dart';
import '../widgets/buttons_bar.dart';
import '../widgets/movie_header.dart';
import '../widgets/movie_info.dart';
import '../widgets/movie_overview.dart';
import '../widgets/plain_text.dart';
import 'movies_list.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  static const String routeName = '/movieDetail';

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<GenresModel> futureGenres;
  final IRepository<GenresModel> repository = GenreRepository();

  @override
  void initState() {
    futureGenres = repository.getModel();
  }

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return SafeArea(
      child: Scaffold(
        backgroundColor: UIConstants.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                backgroundColor: UIConstants.backgroundColor,
                leading: IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    color: UIConstants.contrastColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      MoviesList.routeName,
                    );
                  },
                ),
              ),
              MovieHeader(
                backdrop: movie.fullBackdrop,
                title: movie.title,
              ),
              Padding(
                padding: const EdgeInsets.all(
                  UIConstants.columnPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ButtonsBar(
                      voteAverage: movie.voteAverage,
                      voteCount: movie.voteCount,
                    ),
                    UIConstants.sectionSpace,
                    MovieOverview(
                      overviewText: movie.overview,
                    ),
                    UIConstants.sectionSpace,
                    FutureBuilder<GenresModel>(
                      future: futureGenres,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<GenresModel> snapshot,
                      ) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: PlainText(
                                text: '${snapshot.error}',
                              ),
                            );
                          } else {
                            return MovieInfo(
                              originalTitleText: movie.originalTitle,
                              originalLanguageText: movie.originalLanguage,
                              dateText: movie.releaseDate,
                              genresText: snapshot.data!
                                  .convertIntToString(movie.genres)
                                  .join(", "),
                              ratedText: movie.rated,
                            );
                          }
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
