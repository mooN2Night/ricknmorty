// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_person_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchPersonParams {
  String get name => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchPersonParamsCopyWith<SearchPersonParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPersonParamsCopyWith<$Res> {
  factory $SearchPersonParamsCopyWith(
          SearchPersonParams value, $Res Function(SearchPersonParams) then) =
      _$SearchPersonParamsCopyWithImpl<$Res, SearchPersonParams>;
  @useResult
  $Res call({String name, int page});
}

/// @nodoc
class _$SearchPersonParamsCopyWithImpl<$Res, $Val extends SearchPersonParams>
    implements $SearchPersonParamsCopyWith<$Res> {
  _$SearchPersonParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchPersonParamsImplCopyWith<$Res>
    implements $SearchPersonParamsCopyWith<$Res> {
  factory _$$SearchPersonParamsImplCopyWith(_$SearchPersonParamsImpl value,
          $Res Function(_$SearchPersonParamsImpl) then) =
      __$$SearchPersonParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int page});
}

/// @nodoc
class __$$SearchPersonParamsImplCopyWithImpl<$Res>
    extends _$SearchPersonParamsCopyWithImpl<$Res, _$SearchPersonParamsImpl>
    implements _$$SearchPersonParamsImplCopyWith<$Res> {
  __$$SearchPersonParamsImplCopyWithImpl(_$SearchPersonParamsImpl _value,
      $Res Function(_$SearchPersonParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? page = null,
  }) {
    return _then(_$SearchPersonParamsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchPersonParamsImpl implements _SearchPersonParams {
  const _$SearchPersonParamsImpl({required this.name, required this.page});

  @override
  final String name;
  @override
  final int page;

  @override
  String toString() {
    return 'SearchPersonParams(name: $name, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPersonParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPersonParamsImplCopyWith<_$SearchPersonParamsImpl> get copyWith =>
      __$$SearchPersonParamsImplCopyWithImpl<_$SearchPersonParamsImpl>(
          this, _$identity);
}

abstract class _SearchPersonParams implements SearchPersonParams {
  const factory _SearchPersonParams(
      {required final String name,
      required final int page}) = _$SearchPersonParamsImpl;

  @override
  String get name;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$SearchPersonParamsImplCopyWith<_$SearchPersonParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
