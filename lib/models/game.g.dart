// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      released: json['released'] == null
          ? null
          : DateTime.parse(json['released'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      backgroundImage: json['background_image'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'nameOriginal': instance.name,
      'description': instance.description,
      'released': instance.released?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'backgroundImage': instance.backgroundImage,
      'website': instance.website,
    };
