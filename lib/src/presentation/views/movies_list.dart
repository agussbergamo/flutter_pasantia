import 'package:flutter/material.dart';

import '../../core/parameter/endpoint.dart';
import '../../core/parameter/status.dart';
import '../../core/util/string_constants.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie_event.dart';
import '../bloc/i_movies_bloc.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_progress_indicator.dart';
import '../widgets/movie_list_header.dart';
import '../widgets/movie_list_item.dart';
import '../widgets/msg_widget.dart';

class MoviesList extends StatefulWidget {
  MoviesList({
    super.key,
    required this.moviesBloc,
    required this.title,
    required this.endpoint,
  });

  final IMoviesBloc moviesBloc;
  final String title;
  final Endpoint endpoint;

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  void initState() {
    super.initState();
    widget.moviesBloc.getMoviesByType(widget.endpoint);
  }

  @override
  void dispose() {
    widget.moviesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: UIConstants.backgroundColor,
        ),
        drawer: const AppDrawer(),
        backgroundColor: UIConstants.backgroundColor,
        body: StreamBuilder<MovieEvent>(
          initialData: MovieEvent(
            status: Status.loading,
          ),
          stream: widget.moviesBloc.moviesStream,
          builder: (BuildContext context, AsyncSnapshot<MovieEvent> snapshot) {
            Status status = snapshot.data!.status;
            switch (status) {
              case Status.loading:
                return const CustomProgressIndicator();
              case Status.success:
                return Column(
                  children: [
                    MovieListHeader(
                      title: widget.title,
                    ),
                    UIConstants.sectionSpace,
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.moviesList?.length ?? 0,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return MovieListItem(
                            moviesList: snapshot.data!.moviesList!,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
