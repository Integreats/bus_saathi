import 'dart:io';

import 'package:bus_saathi/l10n/locale.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension_utilities/flutter_extension_utilities.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../controller/camera_controller.dart';

class TakePictureScreen extends StatefulHookConsumerWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
    this.onImagesCaptured,
  });

  final CameraDescription camera;
  final ValueChanged<List<XFile>>? onImagesCaptured;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends ConsumerState<TakePictureScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cameraNotifier = ref.watch(cameraControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title:  Text($strings.photo),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ref.read(cameraControllerProvider.notifier).captureImage();
          widget.onImagesCaptured
              ?.call(ref.read(cameraControllerProvider).requireValue);
        },
        child: ref.watch(cameraControllerProvider).when(
          data: (value) {
            return const Icon(UniconsLine.camera);
          },
          loading: () {
            return SpinKitSpinningCircle(
              size: 24,
              color: context.colorScheme.primary,
            );
          },
          error: (error, stackTrace) {
            return const Icon(UniconsLine.camera);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: cameraNotifier.when(
              skipLoadingOnReload: true,
              skipError: true,
              data: (value) {
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  child: CameraPreview(
                    ref.read(cameraControllerProvider.notifier).controller,
                  ),
                );
              },
              loading: () => const SizedBox(),
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: HookConsumer(
              builder: (context, ref, child) {
                final images = ref.read(cameraControllerProvider).value;
                return (images == null || images.isEmpty)
                    ? const SizedBox.shrink()
                    : _buildGallery();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGallery() {
    return Consumer(
      builder: (context, ref, child) {
        final takenPictures = ref.watch(cameraControllerProvider).requireValue;
        return SizedBox(
          height: 75.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: takenPictures.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.file(
                      File(takenPictures[index].path),
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
