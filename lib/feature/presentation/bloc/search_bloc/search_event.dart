import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
abstract class PersonSearchEvent {}

class SearchPersons extends PersonSearchEvent {
  final String personQuery;

  SearchPersons(this.personQuery);
}
