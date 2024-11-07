import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_person_params.freezed.dart';

@freezed
class GetAllPersonParams with _$GetAllPersonParams {
  const factory GetAllPersonParams({
    required int page,
  }) = _GetAllPersonParams;
}
