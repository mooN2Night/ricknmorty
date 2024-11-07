import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_entity.freezed.dart';

part 'person_entity.g.dart';

///В Dart по умолчанию поодерживается ссылочное равенство. Библиотека Freezed
///добавлена для того, чтобы переопределить ==, hashCode и toString()
@freezed
class PersonEntity with _$PersonEntity {
  const factory PersonEntity({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required LocationEntity origin,
    required LocationEntity location,
    required String image,
    required List<String> episode,
    required DateTime created,
  }) = _PersonEntity;

  factory PersonEntity.fromJson(Map<String, Object?> json) =>
      _$PersonEntityFromJson(json);
}

@freezed
class LocationEntity with _$LocationEntity {
  const factory LocationEntity({
    required String name,
    required String url,
  }) = _LocationEntity;

  factory LocationEntity.fromJson(Map<String, Object?> json) =>
      _$LocationEntityFromJson(json);
}
