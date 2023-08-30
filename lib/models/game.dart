import 'package:game_app/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game extends IBaseModel {
  int? id;
  String? name;
  String? description;
  DateTime? released;
  DateTime? updated;
  String? backgroundImage;
  String? website;

  Game(
      {this.id,
      this.name,
      this.description,
      this.released,
      this.updated,
      this.backgroundImage,
      this.website});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$GameFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$GameToJson(this);
  }
}
