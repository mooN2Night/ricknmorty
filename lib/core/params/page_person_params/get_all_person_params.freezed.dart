// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_person_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllPersonParams {
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetAllPersonParamsCopyWith<GetAllPersonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllPersonParamsCopyWith<$Res> {
  factory $GetAllPersonParamsCopyWith(
          GetAllPersonParams value, $Res Function(GetAllPersonParams) then) =
      _$GetAllPersonParamsCopyWithImpl<$Res, GetAllPersonParams>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$GetAllPersonParamsCopyWithImpl<$Res, $Val extends GetAllPersonParams>
    implements $GetAllPersonParamsCopyWith<$Res> {
  _$GetAllPersonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllPersonParamsImplCopyWith<$Res>
    implements $GetAllPersonParamsCopyWith<$Res> {
  factory _$$GetAllPersonParamsImplCopyWith(_$GetAllPersonParamsImpl value,
          $Res Function(_$GetAllPersonParamsImpl) then) =
      __$$GetAllPersonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$GetAllPersonParamsImplCopyWithImpl<$Res>
    extends _$GetAllPersonParamsCopyWithImpl<$Res, _$GetAllPersonParamsImpl>
    implements _$$GetAllPersonParamsImplCopyWith<$Res> {
  __$$GetAllPersonParamsImplCopyWithImpl(_$GetAllPersonParamsImpl _value,
      $Res Function(_$GetAllPersonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$GetAllPersonParamsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetAllPersonParamsImpl implements _GetAllPersonParams {
  const _$GetAllPersonParamsImpl({required this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'GetAllPersonParams(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllPersonParamsImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllPersonParamsImplCopyWith<_$GetAllPersonParamsImpl> get copyWith =>
      __$$GetAllPersonParamsImplCopyWithImpl<_$GetAllPersonParamsImpl>(
          this, _$identity);
}

abstract class _GetAllPersonParams implements GetAllPersonParams {
  const factory _GetAllPersonParams({required final int page}) =
      _$GetAllPersonParamsImpl;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$GetAllPersonParamsImplCopyWith<_$GetAllPersonParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
