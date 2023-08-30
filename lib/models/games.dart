import 'package:game_app/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'games.g.dart';

@JsonSerializable()
class Games extends IBaseModel {
  List<Result>? results;

  Games({this.results});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$GamesFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$GamesToJson(this);
  }
}

@JsonSerializable()
class Result extends IBaseModel {
  int? id;
  String? name;
  String? backgroundImage;
  double? rating;
  List<Genre>? genres;

  Result({
    this.id,
    this.name,
    this.backgroundImage,
    this.rating,
    this.genres,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ResultToJson(this);
  }
}

@JsonSerializable()
class Genre extends IBaseModel {
  String? name;

  Genre({this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return _$GenreFromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$GenreFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$GenreToJson(this);
  }
}
