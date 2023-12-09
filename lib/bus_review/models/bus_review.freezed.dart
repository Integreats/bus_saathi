// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusReview _$BusReviewFromJson(Map<String, dynamic> json) {
  return _BusReview.fromJson(json);
}

/// @nodoc
mixin _$BusReview {
  String get id => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get review => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusReviewCopyWith<BusReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusReviewCopyWith<$Res> {
  factory $BusReviewCopyWith(BusReview value, $Res Function(BusReview) then) =
      _$BusReviewCopyWithImpl<$Res, BusReview>;
  @useResult
  $Res call(
      {String id,
      String vehicleId,
      String userId,
      int rating,
      String review,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$BusReviewCopyWithImpl<$Res, $Val extends BusReview>
    implements $BusReviewCopyWith<$Res> {
  _$BusReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleId = null,
    Object? userId = null,
    Object? rating = null,
    Object? review = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusReviewImplCopyWith<$Res>
    implements $BusReviewCopyWith<$Res> {
  factory _$$BusReviewImplCopyWith(
          _$BusReviewImpl value, $Res Function(_$BusReviewImpl) then) =
      __$$BusReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String vehicleId,
      String userId,
      int rating,
      String review,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$BusReviewImplCopyWithImpl<$Res>
    extends _$BusReviewCopyWithImpl<$Res, _$BusReviewImpl>
    implements _$$BusReviewImplCopyWith<$Res> {
  __$$BusReviewImplCopyWithImpl(
      _$BusReviewImpl _value, $Res Function(_$BusReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleId = null,
    Object? userId = null,
    Object? rating = null,
    Object? review = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BusReviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusReviewImpl implements _BusReview {
  _$BusReviewImpl(
      {required this.id,
      required this.vehicleId,
      required this.userId,
      required this.rating,
      required this.review,
      required this.createdAt,
      required this.updatedAt});

  factory _$BusReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusReviewImplFromJson(json);

  @override
  final String id;
  @override
  final String vehicleId;
  @override
  final String userId;
  @override
  final int rating;
  @override
  final String review;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BusReview(id: $id, vehicleId: $vehicleId, userId: $userId, rating: $rating, review: $review, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, vehicleId, userId, rating, review, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusReviewImplCopyWith<_$BusReviewImpl> get copyWith =>
      __$$BusReviewImplCopyWithImpl<_$BusReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusReviewImplToJson(
      this,
    );
  }
}

abstract class _BusReview implements BusReview {
  factory _BusReview(
      {required final String id,
      required final String vehicleId,
      required final String userId,
      required final int rating,
      required final String review,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$BusReviewImpl;

  factory _BusReview.fromJson(Map<String, dynamic> json) =
      _$BusReviewImpl.fromJson;

  @override
  String get id;
  @override
  String get vehicleId;
  @override
  String get userId;
  @override
  int get rating;
  @override
  String get review;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BusReviewImplCopyWith<_$BusReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
