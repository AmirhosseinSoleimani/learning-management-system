class Movie {
  String? id;
  String? rank;
  String? title;
  String? fullTitle;
  String? year;
  String? image;
  String? crew;
  String? imDbRating;
  String? imDbRatingCount;

  Movie(
      {this.id,
        this.rank,
        this.title,
        this.fullTitle,
        this.year,
        this.image,
        this.crew,
        this.imDbRating,
        this.imDbRatingCount});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    title = json['title'];
    fullTitle = json['fullTitle'];
    year = json['year'];
    image = json['image'];
    crew = json['crew'];
    imDbRating = json['imDbRating'];
    imDbRatingCount = json['imDbRatingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['rank'] = rank;
    data['title'] = title;
    data['fullTitle'] = fullTitle;
    data['year'] = year;
    data['image'] = image;
    data['crew'] = crew;
    data['imDbRating'] = imDbRating;
    data['imDbRatingCount'] = imDbRatingCount;
    return data;
  }
}