import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraControllerProvider =
    AutoDisposeAsyncNotifierProvider<CameraControllerNotifier, List<XFile>>(
        CameraControllerNotifier.new);

class CameraControllerNotifier extends AutoDisposeAsyncNotifier<List<XFile>> {
  late final CameraController controller;

  @override
  Future<List<XFile>> build() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;

    controller = CameraController(
      // Get a specific camera from the list of available cameras.
      firstCamera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    await controller.initialize();
    await controller.setFlashMode(FlashMode.off);

    return [];
  }

  Future<void> captureImage() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final image = await controller.takePicture();
      await controller.setFlashMode(FlashMode.off);

      return [
        ...state.value ?? [],
        image,
      ];
    });
  }

  void clear() {
    state = const AsyncValue.data([]);
  }
}
