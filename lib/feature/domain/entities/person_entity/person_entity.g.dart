// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonEntityImpl _$$PersonEntityImplFromJson(Map<String, dynamic> json) =>
    _$PersonEntityImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: LocationEntity.fromJson(json['origin'] as Map<String, dynamic>),
      location:
          LocationEntity.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$PersonEntityImplToJson(_$PersonEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'created': instance.created.toIso8601String(),
    };

_$LocationEntityImpl _$$LocationEntityImplFromJson(Map<String, dynamic> json) =>
    _$LocationEntityImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$LocationEntityImplToJson(
        _$LocationEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
