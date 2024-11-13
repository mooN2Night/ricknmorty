import 'package:rick_and_morty/feature/data/models/person_model/person_model.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';

class Mapper {
  PersonEntity personToEntity(PersonModel personModel) {
    return PersonEntity(
      id: personModel.id,
      name: personModel.name,
      status: personModel.status,
      species: personModel.species,
      type: personModel.type,
      gender: personModel.gender,
      origin: locationToEntity(personModel.origin),
      location: locationToEntity(personModel.location),
      image: personModel.image,
      episode: personModel.episode,
      created: personModel.created,
    );
  }

  LocationEntity locationToEntity(LocationModel locationModel) {
    return LocationEntity(
      name: locationModel.name,
      url: locationModel.url,
    );
  }

}