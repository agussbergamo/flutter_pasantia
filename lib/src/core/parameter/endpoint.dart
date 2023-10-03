enum Endpoint {
  popular('popular'),
  nowPlaying('now_playing'),
  topRated('top_rated'),
  upcoming('upcoming');

  const Endpoint(this.name);

  final String name;
}
