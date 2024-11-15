import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_person_params.freezed.dart';

@freezed
class SearchPersonParams with _$SearchPersonParams {
  const factory SearchPersonParams({
    required String name,
    required int page,
  }) = _SearchPersonParams;
}
