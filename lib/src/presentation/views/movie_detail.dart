import 'package:flutter/material.dart';

import '../../core/parameter/status.dart';
import '../../core/util/genres_utils.dart';
import '../../core/util/string_constants.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/genre_event.dart';
import '../../domain/entity/movie.dart';
import '../bloc/i_genres_bloc.dart';
import '../widgets/buttons_bar.dart';
import '../widgets/custom_progress_indicator.dart';
import '../widgets/movie_header.dart';
import '../widgets/movie_info.dart';
import '../widgets/movie_overview.dart';
import '../widgets/msg_widget.dart';

class MovieDetail extends StatefulWidget {
  MovieDetail({
    super.key,
    required this.genresBloc,
  });

  final IGenresBloc genresBloc;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.genresBloc.getGenres();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Movie movie = args['movie'];
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
                    key: Key('appBarIcon'),
                    color: UIConstants.contrastColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
                    StreamBuilder<GenreEvent>(
                      initialData: GenreEvent(
                        status: Status.loading,
                      ),
                      stream: widget.genresBloc.genresStream,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<GenreEvent> snapshot,
                      ) {
                        Status status = snapshot.data!.status;
                        switch (status) {
                          case Status.loading:
                            return const CustomProgressIndicator();
                          case Status.success:
                            return MovieInfo(
                              originalTitleText: movie.originalTitle,
                              originalLanguageText: movie.originalLanguage,
                              dateText: movie.releaseDate,
                              genresText: movie.genres
                                  .convertIntToString(
                                      snapshot.data!.genresList!)
                                  .join(", "),
                              ratedText: movie.rated,
                            );
                          case Status.error:
                            return MsgWidget(
                              text: '${snapshot.error.toString()}',
                            );
                          case Status.empty:
                            return MsgWidget(
                              text: StringConstants.emptyMsg,
                            );
                        }
                      },
                    ),
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
