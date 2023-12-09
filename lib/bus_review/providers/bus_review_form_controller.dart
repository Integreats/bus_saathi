import 'package:bus_saathi/bus_review/widgets/camera/controller/camera_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bus_review_form.dart';

final busReviewFormControllerProvider =
    AutoDisposeNotifierProvider<BusReviewFormNotifier, BusReviewForm>(
        BusReviewFormNotifier.new);

class BusReviewFormNotifier extends AutoDisposeNotifier<BusReviewForm> {
  @override
  build() {
    final images =
        ref.watch(cameraControllerProvider).value?.map((e) => e.path).toList();
    return BusReviewForm.empty().copyWith(
      images: images ?? [],
    );
  }

  void updateRating(int rating) {
    state = state.copyWith(rating: rating);
  }

  void updateReview(String review) {
    state = state.copyWith(review: review);
  }

  void updateImages(List<XFile> images) {
    state = state.copyWith(
      images: images.map((e) => e.path).toList(),
    );
  }
}
