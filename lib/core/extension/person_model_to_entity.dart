import 'package:rick_and_morty/feature/data/models/person_model/person_model.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';

extension PersonModelX on PersonModel {
  PersonEntity toEntity() {
    return PersonEntity(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin.toEntity(),
      location: location.toEntity(),
      image: image,
      episode: episode,
      created: created,
    );
  }
}