import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'bus_review_form.freezed.dart';
part 'bus_review_form.g.dart';

@freezed
class BusReviewForm with _$BusReviewForm {
  factory BusReviewForm({
    required String id,
    required String vehicleId,
    required String userId,
    required int rating,
    required String review,
    required List<String> images,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BusReview;

  factory BusReviewForm.fromJson(Map<String, dynamic> json) =>
      _$BusReviewFormFromJson(json);

  factory BusReviewForm.empty() {
    const uuid = Uuid();

    return BusReviewForm(
      id: uuid.v4(),
      vehicleId: '',
      userId: '',
      rating: 0,
      review: '',
      images: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
