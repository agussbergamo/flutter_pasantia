abstract class StringConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String baseUrlImages = 'https://image.tmdb.org/t/p/w500';

  static const String popularRouteName = '/popularMoviesGrid';
  static const String upcomingRouteName = '/upcomingMoviesGrid';
  static const String topRatedRouteName = '/topRatedMoviesList';
  static const String nowPlayingRouteName = '/nowPlayingMoviesPageView';
  static const String movieDetailRouteName = '/movieDetail';

  static const String popularTitle = 'Popular Movies';
  static const String upcomingTitle = 'Upcoming movies';
  static const String topRatedTitle = 'Top rated movies';
  static const String nowPlayingTitle = 'Upcoming movies';

  static const String emptyMsg =
      'Sorry, it seems that we can´t show you this content right now!';

  static const String moviesException = 'Failed to load movies';
  static const String genresException = 'Failed to load genres';
}
