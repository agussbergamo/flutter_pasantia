class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  bool operator ==(genre) => genre is Genre && genre.id == this.id;
}
