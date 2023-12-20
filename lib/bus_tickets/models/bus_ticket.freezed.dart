// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusTicket _$BusTicketFromJson(Map<String, dynamic> json) {
  return _BusTicket.fromJson(json);
}

/// @nodoc
mixin _$BusTicket {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  BusStop get origin => throw _privateConstructorUsedError;
  BusStop get destination => throw _privateConstructorUsedError;
  double get ticketAmount => throw _privateConstructorUsedError;
  String get paymentId => throw _privateConstructorUsedError;
  bool get isCheckedIn => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusTicketCopyWith<BusTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusTicketCopyWith<$Res> {
  factory $BusTicketCopyWith(BusTicket value, $Res Function(BusTicket) then) =
      _$BusTicketCopyWithImpl<$Res, BusTicket>;
  @useResult
  $Res call(
      {String id,
      String userId,
      BusStop origin,
      BusStop destination,
      double ticketAmount,
      String paymentId,
      bool isCheckedIn,
      DateTime createdAt,
      DateTime updatedAt});

  $BusStopCopyWith<$Res> get origin;
  $BusStopCopyWith<$Res> get destination;
}

/// @nodoc
class _$BusTicketCopyWithImpl<$Res, $Val extends BusTicket>
    implements $BusTicketCopyWith<$Res> {
  _$BusTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? origin = null,
    Object? destination = null,
    Object? ticketAmount = null,
    Object? paymentId = null,
    Object? isCheckedIn = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as BusStop,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as BusStop,
      ticketAmount: null == ticketAmount
          ? _value.ticketAmount
          : ticketAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      isCheckedIn: null == isCheckedIn
          ? _value.isCheckedIn
          : isCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool,
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

  @override
  @pragma('vm:prefer-inline')
  $BusStopCopyWith<$Res> get origin {
    return $BusStopCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BusStopCopyWith<$Res> get destination {
    return $BusStopCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusTicketImplCopyWith<$Res>
    implements $BusTicketCopyWith<$Res> {
  factory _$$BusTicketImplCopyWith(
          _$BusTicketImpl value, $Res Function(_$BusTicketImpl) then) =
      __$$BusTicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      BusStop origin,
      BusStop destination,
      double ticketAmount,
      String paymentId,
      bool isCheckedIn,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $BusStopCopyWith<$Res> get origin;
  @override
  $BusStopCopyWith<$Res> get destination;
}

/// @nodoc
class __$$BusTicketImplCopyWithImpl<$Res>
    extends _$BusTicketCopyWithImpl<$Res, _$BusTicketImpl>
    implements _$$BusTicketImplCopyWith<$Res> {
  __$$BusTicketImplCopyWithImpl(
      _$BusTicketImpl _value, $Res Function(_$BusTicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? origin = null,
    Object? destination = null,
    Object? ticketAmount = null,
    Object? paymentId = null,
    Object? isCheckedIn = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BusTicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as BusStop,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as BusStop,
      ticketAmount: null == ticketAmount
          ? _value.ticketAmount
          : ticketAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      isCheckedIn: null == isCheckedIn
          ? _value.isCheckedIn
          : isCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$BusTicketImpl implements _BusTicket {
  _$BusTicketImpl(
      {required this.id,
      required this.userId,
      required this.origin,
      required this.destination,
      required this.ticketAmount,
      required this.paymentId,
      required this.isCheckedIn,
      required this.createdAt,
      required this.updatedAt});

  factory _$BusTicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusTicketImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final BusStop origin;
  @override
  final BusStop destination;
  @override
  final double ticketAmount;
  @override
  final String paymentId;
  @override
  final bool isCheckedIn;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BusTicket(id: $id, userId: $userId, origin: $origin, destination: $destination, ticketAmount: $ticketAmount, paymentId: $paymentId, isCheckedIn: $isCheckedIn, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusTicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.ticketAmount, ticketAmount) ||
                other.ticketAmount == ticketAmount) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.isCheckedIn, isCheckedIn) ||
                other.isCheckedIn == isCheckedIn) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, origin, destination,
      ticketAmount, paymentId, isCheckedIn, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusTicketImplCopyWith<_$BusTicketImpl> get copyWith =>
      __$$BusTicketImplCopyWithImpl<_$BusTicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusTicketImplToJson(
      this,
    );
  }
}

abstract class _BusTicket implements BusTicket {
  factory _BusTicket(
      {required final String id,
      required final String userId,
      required final BusStop origin,
      required final BusStop destination,
      required final double ticketAmount,
      required final String paymentId,
      required final bool isCheckedIn,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$BusTicketImpl;

  factory _BusTicket.fromJson(Map<String, dynamic> json) =
      _$BusTicketImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  BusStop get origin;
  @override
  BusStop get destination;
  @override
  double get ticketAmount;
  @override
  String get paymentId;
  @override
  bool get isCheckedIn;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BusTicketImplCopyWith<_$BusTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
