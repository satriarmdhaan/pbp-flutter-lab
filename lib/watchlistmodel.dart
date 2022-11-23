class WatchlistModel {
  int? id;
  String? title;
  String? watched;
  int? rating;
  String? releaseDate;
  String? review;

  WatchlistModel({
    this.id,
    this.title,
    this.watched,
    this.rating,
    this.releaseDate,
    this.review,
  });

  WatchlistModel.fromJson(Map<String,dynamic> json) {
    id= json["id"];
    title= json["title"];
    watched= json["watched"];
    rating= json["rating"];
    releaseDate= json["release_date"];
    review= json["review"];
  }

}

