import 'dart:io';

import 'package:bus_saathi/bus/repositories/bus_repository.dart';
import 'package:bus_saathi/bus_review/providers/bus_review_form_controller.dart';
import 'package:bus_saathi/l10n/locale.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension_utilities/flutter_extension_utilities.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../../widgets/buttons/elevated_loader_button.dart';
import '../../widgets/textfields/custom_text_form_field.dart';
import '../repositories/bus_review_repository.dart';
import '../widgets/camera/screens/take_picture_screen.dart';

class BusReviewScreen extends StatefulHookConsumerWidget {
  const BusReviewScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BusReviewScreen> createState() => _BusReviewScreenState();
}

class _BusReviewScreenState extends ConsumerState<BusReviewScreen> {
  List<CameraDescription> _cameras = <CameraDescription>[];

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    try {
      _cameras = await availableCameras();
    } on CameraException catch (e) {
      _logError(e.code, e.description);
    }
  }

  void _logError(String code, String? description) {
    // Handle the case where 'description' might be null
    String errorMessage = description ?? 'No description available';
    print('Error: $code\nError Message: $errorMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    $strings.experience,
                    style: context.textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(16),
                  Center(
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      unratedColor: Colors.grey.shade200,
                      glow: false,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 60,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        ref
                            .read(busReviewFormControllerProvider.notifier)
                            .updateRating(rating.toInt());
                      },
                    ),
                  ),
                  const Gap(16),
                  Text(
                    $strings.review,
                    style: context.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(4),
                  CustomTextFormField(
                    minHeight: 256,
                    maxHeight: 256,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    hintText: $strings.hintText,
                    onChanged: (value) {
                      ref
                          .read(busReviewFormControllerProvider.notifier)
                          .updateReview(value);
                    },
                  ),
                  const Gap(16),
                  const SizedBox(height: 12),
                  _buildGallery(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedLoaderButton(
                      onPressed: () async {
                        await ref
                            .read(busReviewFormControllerProvider.notifier)
                            .save();
                      },
                      label: Text($strings.submitReview),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGallery() {
    final takenPictures =
        ref.watch(busReviewFormControllerProvider).images.toList();
    if (takenPictures.isEmpty) {
      return InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TakePictureScreen(
                camera: _cameras.first,
              ),
            ),
          );
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(
              UniconsLine.camera_plus,
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: takenPictures.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(
                    File(takenPictures[index]),
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}
