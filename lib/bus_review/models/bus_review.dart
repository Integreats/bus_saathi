import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus_review.freezed.dart';
part 'bus_review.g.dart';

@freezed
class BusReview with _$BusReview {
  factory BusReview({
    required String id,
    required String vehicleId,
    required String userId,
    required int rating,
    required String review,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BusReview;

  factory BusReview.fromJson(Map<String, dynamic> json) =>
      _$BusReviewFromJson(json);
}
